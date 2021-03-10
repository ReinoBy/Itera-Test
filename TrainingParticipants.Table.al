table 50102 "SOL TrainingParticipants"
{

    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Course No."; Code[20])
        {
            Caption = 'No.', Comment = 'et-EE=Number';

            DataClassification = ToBeClassified;
        }
        field(2; "Employee No."; Code[20])
        {
            Caption = 'Employee No.', Comment = 'et-EE=Töötaja number';
            TableRelation = Employee;
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Rec.CreateDimension();
            end;


        }
        field(3; "Employee Name"; Text[50])
        {
            Caption = 'Employee Name', Comment = 'et-EE=Töötaja nimi';

            FieldClass = FlowField;
            CalcFormula = lookup(Employee."Last Name" where("No." = field("Employee No.")));
            Editable = false;
        }
        field(4; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID', Comment = 'et-EE=Dimensiooni Set ID';
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "Course No.", "Employee No.")
        {
            Clustered = true;
        }
    }

    var
        "Human Resources Setup": Record "Human Resources Setup";
        DimensionManagement: Codeunit DimensionManagement;
        DimensionValue: Record "Dimension Value";
        DimSetEntry: Record "Dimension Set Entry" temporary;
        OldDimSetID: Integer;

        Training: Record "SOL Training";
        Employee: Record Employee;

    procedure CreateDimension()

    begin
        OldDimSetID := "Dimension Set ID";
        "Human Resources Setup".Get();
        DimensionValue.Init();
        if DimensionValue.Get("Human Resources Setup"."SOL Employee Dimension Code", "Employee No.") then begin
            Employee.Get("Employee No.");
            DimensionValue.Validate(Name, StrSubstNo('%1 %2', Employee."First Name", Employee."Last Name"));
            DimensionValue.Modify(true);
        end else begin
            DimensionValue.Validate("Dimension Code", "Human Resources Setup"."SOL Employee Dimension Code");
            Employee.Get("Employee No.");
            DimensionValue.Validate(Code, "Employee No.");
            DimensionValue.Validate(Name, StrSubstNo('%1 %2', Employee."First Name", Employee."Last Name"));
            DimensionValue.Insert(true);
        end;
        Training.SetRange("No.", Rec."Course No.");
        if Training.FindFirst() then
            DimensionManagement.GetDimensionSet(DimSetEntry, Training."Dimension Set ID");
        DimSetEntry.Init();
        DimSetEntry.Validate("Dimension Code", DimensionValue."Dimension Code");
        DimSetEntry.Validate("Dimension Value Code", DimensionValue.Code);
        if not DimSetEntry.Insert(true) then
            DimSetEntry.Modify(true);
        "Dimension Set ID" := DimensionManagement.GetDimensionSetID(DimSetEntry);
    end;

    procedure RowDim()

    begin

        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimensionManagement.EditDimensionSet(
            "Dimension Set ID", StrSubstNo('%1 %2', "Human Resources Setup"."SOL Employee Dimension Code", "Employee No.")
            );
        if OldDimSetID <> "Dimension Set ID" then begin
            Modify;
        end;
    end;


}