table 50100 "SOL Book"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.', Comment = 'et-EE=Number';
            DataClassification = ToBeClassified;
        }
        field(2; Title; Text[50])
        {
            Caption = 'Title';
            DataClassification = ToBeClassified;
        }

        field(3; Author; Text[50])
        {
            Caption = 'Author';
            DataClassification = ToBeClassified;

        }
        field(4; Hardcover; Boolean)
        {
            Caption = 'Hardcover';
            DataClassification = ToBeClassified;
        }

        field(5; "Page count"; Integer)
        {
            Caption = 'Page count';
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