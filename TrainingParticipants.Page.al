page 50104 "SOL TrainingParticipants"
{
    PageType = ListPart;
    SourceTable = "SOL TrainingParticipants";

    layout
    {
        area(Content)
        {
            repeater(Participants)
            {
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Dimensions)
            {
                ApplicationArea = all;
                PromotedOnly = true;
                Promoted = true;
                PromotedCategory = Category4;
                // RunObject = ;
                trigger OnAction()
                begin
                    // rec.RowDim();
                end;
            }

        }
    }


}