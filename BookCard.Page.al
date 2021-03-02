page 50100 "SOL BookCard"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "SOL Book";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                }

            }
            group(Details)
            {
                Caption = 'Details';
                field(Author; Rec.Author)
                {
                    ApplicationArea = All;
                }
                field(Hardcover; Rec.Hardcover)
                {
                    ApplicationArea = All;
                }
                field("Page count"; Rec."Page count")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}