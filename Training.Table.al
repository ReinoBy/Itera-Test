table 50101 "SOL Training"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.', Comment = 'et-EE=Number';
            DataClassification = ToBeClassified;
        }

        field(2; Description; Text[50])
        {
            Caption = 'Description', Comment = 'et-EE=Kirjeldus';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Rec.CreateDimension();
            end;

        }

        field(3; Location; Text[50])
        {
            Caption = 'Location', Comment = 'et-EE=Asukoht';
            DataClassification = ToBeClassified;
        }
        field(4; "Start Date"; Date)
        {
            Caption = 'Start Date', Comment = 'et-EE=Alguskuupäev';
            DataClassification = ToBeClassified;
        }

        field(5; "End Date"; Date)
        {
            Caption = 'End Date', Comment = 'et-EE=Lõppkuupäev';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                ErrorLbl: Label 'End date must be after start date!', Comment = 'et-EE=Lõpukuupäev peab olema pärast alguskuupäeva!';
            begin
                if "End Date" < "Start Date" then
                    Error(ErrorLbl);
                if ("Start Date" <> 0D) and ("End Date" <> 0D) then
                    "Training Duration" := "End Date" - "Start Date";
            end;
        }
        field(6; "Training Duration"; Integer)
        {
            Caption = 'Training Duration', Comment = 'et-EE=Kestvus';
            DataClassification = ToBeClassified;
        }
        field(7; Fee; Integer)
        {
            Caption = 'Fee', Comment = 'et-EE=Hind';
            DataClassification = ToBeClassified;
        }
        field(8; "No. of Participants"; Integer)
        {
            Caption = 'No. of Participants', Comment = 'et-EE=Osalejate arv';
            FieldClass = FlowField;
            CalcFormula = count("SOL TrainingParticipants" where("Course No." = field("No.")));
        }
        field(9; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID', Comment = 'et-EE=Dimension Set ID';
            DataClassification = ToBeClassified;
        }
        field(10; "Detailed description"; Blob)
        {
            Caption = 'Detailed description', Comment = 'et-EE=Täpsem kirjeldus';
            DataClassification = ToBeClassified;
        }

        field(11; "Description File Name"; Text[50])
        {
            Caption = 'Description File Name', Comment = 'et-EE=Kirjelduse fail';
            DataClassification = ToBeClassified;
        }
        field(12; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }


    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
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



    trigger OnInsert()

    begin
        if "No." = '' then begin
            "Human Resources Setup".Get();
            "Human Resources Setup".TestField("SOL Training No.");
            NoSeriesMgt.InitSeries("Human Resources Setup"."SOL Training No.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    procedure CreateDimension()

    begin
        OldDimSetID := "Dimension Set ID";
        "Human Resources Setup".Get();
        DimensionValue.Init();
        if DimensionValue.Get("Human Resources Setup"."SOL Training Dimension Code", rec."No.") then begin
            DimensionValue.Validate(Name, Description);
            DimensionValue.Modify(true);
        end else begin
            DimensionValue.Validate("Dimension Code", "Human Resources Setup"."SOL Training Dimension Code");
            DimensionValue.Validate(Code, "No.");
            DimensionValue.Validate(Name, Description);
            DimensionValue.Insert(true);
        end;
        DimensionManagement.GetDimensionSet(DimSetEntry, "Dimension Set ID");
        DimSetEntry.Init();
        DimSetEntry.Validate("Dimension Code", DimensionValue."Dimension Code");
        DimSetEntry.Validate("Dimension Value Code", DimensionValue.Code);
        if not DimSetEntry.Insert(true) then
            DimSetEntry.Modify(true);
        "Dimension Set ID" := DimensionManagement.GetDimensionSetID(DimSetEntry);
        Rec.Modify(true);

    end;

    procedure RowDim()

    begin

        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimensionManagement.EditDimensionSet(
            "Dimension Set ID", StrSubstNo('%1 %2', "Human Resources Setup"."SOL Training Dimension Code", "No."));
        if OldDimSetID <> "Dimension Set ID" then begin
            Modify;
        end;
    end;

}