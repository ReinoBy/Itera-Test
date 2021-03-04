table 50101 "SOL Training"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.', Comment = 'et-EE=Number';
            DataClassification = ToBeClassified;
        }

        field(2; Description; Text[50])
        {
            Caption = 'Description', Comment = 'et-EE=Kirjeldus';
            DataClassification = ToBeClassified;
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


    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

}