page 50103 "SOL TrainingCard"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "SOL Training";
    PromotedActionCategories = 'Manage,Koolitus,bla,Dimensions,Employee dimensions,,,,';


    layout
    {
        area(Content)
        {
            group(General)
            {

                Caption = 'General';
                field("No."; Rec."No.")
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Fee; Rec.Fee)
                {
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }
            }
            group(Detailed)
            {
                Caption = 'Detailed';
                field("Description File Name"; Rec."Description File Name")
                {
                    ApplicationArea = All;
                }
                field("Detailed description"; Rec."Detailed description")
                {
                    ApplicationArea = All;
                }

                field(Location; Rec.Location)
                {
                    ApplicationArea = All;
                }
                field("No. of Participants"; Rec."No. of Participants")
                {
                    ApplicationArea = All;
                }
                field("Duration"; Rec."Training Duration")
                {
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group(Participants)
            {
                part("SOL TrainingParticipants"; "SOL TrainingParticipants")
                {
                    ApplicationArea = All;
                    SubPageLink = "Course No." = field("No.");

                }
            }



        }
        area(FactBoxes)
        {

            part("SOL EmployeeCardPart"; "SOL EmployeeCardPart")
            {
                ApplicationArea = All;
                Provider = "SOL TrainingParticipants";
                SubPageLink = "No." = field("Employee No.");
            }

        }

    }
    actions
    {
        area(Creation)
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
                    rec.RowDim();
                end;
            }

        }
    }
}

