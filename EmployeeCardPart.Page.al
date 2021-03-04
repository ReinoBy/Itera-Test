page 50105 "SOL EmployeeCardPart"
{
    PageType = CardPart;
    SourceTable = Employee;

    layout
    {
        area(Content)
        {
            group("Employee details")
            {
                field(Image; Rec.Image)
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = All;
                }
                field("Birth Date"; Rec."Birth Date")
                {
                    ApplicationArea = All;
                }
                field("Company E-Mail"; Rec."Company E-Mail")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

}