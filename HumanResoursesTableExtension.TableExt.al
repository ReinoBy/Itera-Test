tableextension 50101 "HumanResoursesTableExtension" extends "Human Resources Setup"
{
    fields
    {
        field(50101; "SOL Training No."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }

        field(50102; "SOL Training Dimension Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Dimension;
        }

        field(50103; "SOL Employee Dimension Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Dimension;
        }
    }
    var
        "Human Resources Setup": Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DimensionManagement: Codeunit DimensionManagement;
        DimensionValue: Record "Dimension Value";
        DimSetEntry: Record "Dimension Set Entry" temporary;
        OldDimSetID: Integer;
        ParticipantLine: Record "SOL TrainingParticipants";
        Employee: Record Employee;

    procedure EnterEmployeeDimensionValue()

    begin

        "Human Resources Setup".Get();
        Employee.Reset();
        if Employee.FindSet() then
            repeat
                DimensionValue.Init();
                if DimensionValue.Get("Human Resources Setup"."SOL Employee Dimension Code", Employee."No.") then begin
                    DimensionValue.Validate(Name, StrSubstNo('%1 %2', Employee."First Name", Employee."Last Name"));
                    DimensionValue.Modify(true);
                end else begin
                    DimensionValue.Validate("Dimension Code", "Human Resources Setup"."SOL Employee Dimension Code");
                    DimensionValue.Validate(Code, Employee."No.");
                    DimensionValue.Validate(Name, StrSubstNo('%1 %2', Employee."First Name", Employee."Last Name"));
                    DimensionValue.Insert(true);
                end;
            until Employee.Next = 0;
        Message('Employee''s dimensions added');

    end;

}