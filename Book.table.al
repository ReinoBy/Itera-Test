table 50100 "SOL Book"
{
    DataClassification = CustomerContent;
    DrillDownPageId = "SOL BookList";
    LookupPageId = "SOL BookList";
    Permissions = tabledata "G/L ENTRY" = RM;


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
            BlankZero = true;
            Caption = 'Page count';
            DataClassification = ToBeClassified;
        }
        field(6; "No. of customers"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Customer where("SOL Favourite Book Nr" = field("No.")));
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