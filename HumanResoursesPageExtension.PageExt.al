pageextension 50101 "HumanResoursesPageExtension" extends "Human Resources Setup"
{

    layout
    {
        addlast(Numbering)
        {
            field("SOL Training Dimension Code"; Rec."SOL Training Dimension Code")
            {
                ApplicationArea = All;
            }
            field("SOL Sol Training No."; Rec."Sol Training No.")
            {
                ApplicationArea = All;
            }
            field("SOL Employee Dimension Code"; Rec."SOL Employee Dimension Code")
            {
                ApplicationArea = All;
            }

        }
    }

    actions
    {
        addlast(Creation)
        {
            action("SOL Dimensions")
            {
                ApplicationArea = all;
                PromotedOnly = true;
                Promoted = true;
                PromotedCategory = Process;
                // RunObject = ;
                trigger OnAction()

                begin
                    rec.EnterEmployeeDimensionValue();
                end;
            }
        }
    }

}