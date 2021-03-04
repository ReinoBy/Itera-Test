page 50102 "SOL TrainingList"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "SOL Training";
    CardPageId = "SOL TrainingCard";

    layout
    {
        area(Content)
        {
            repeater(Trainings)
            {
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
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                }
                field("No. of Participants"; Rec."No. of Participants")
                {
                    ApplicationArea = All;
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = All;
                }

            }
        }
    }

}