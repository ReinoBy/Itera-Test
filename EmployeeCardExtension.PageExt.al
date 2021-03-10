pageextension 50103 "SOL EmployeeCardExtension" extends "Employee Card"
{
    layout
    {
        // Add changes to page layout here
        addlast(Administration)
        {
            field("SOL Training cost"; Rec."SOL Training costs")
            {
                ApplicationArea = All;

            }

            field("SOL Training Days"; rec."SOL Training Days")
            {
                ApplicationArea = all;
            }
        }


    }

    actions
    {
        addlast(Reporting)
        {
            action("SOL Trainings")
            {
                ApplicationArea = all;
                PromotedOnly = true;
                Promoted = true;
                PromotedCategory = Process;
                // RunObject = ;
                trigger OnAction()

                begin
                    rec.EmployeeTrainings();
                end;
            }
        }
    }

    trigger OnAfterGetRecord()

    begin
        rec.EmployeeTrainingCosts();
    end;

}