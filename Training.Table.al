table 50101 "SOL Training"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(2; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }

        field(3; Location; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }

        field(5; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                ErrorLbl: Label 'End date must be after start date!', Comment = 'et-EE=Lõpukuupäev peab olema pärast alguskuupäeva!';
            begin
                if "End Date" < "Start Date" then
                    Error(ErrorLbl);
                if ("Start Date" <> 0D) and ("End Date" <> 0D) then
                    Duration := "End Date" - "Start Date";
            end;
        }
        field(6; "Duration"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; Fee; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "No. of Participants"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("SOL TrainingParticipants" where("Course No." = field("No.")));
        }
        field(9; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Detailed description"; Blob)
        {
            DataClassification = ToBeClassified;
        }

        field(11; "Description File Name"; Text[50])
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

}