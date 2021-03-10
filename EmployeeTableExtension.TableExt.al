tableextension 50102 "SOL EmployeeTableExtension" extends Employee
{
    fields
    {
        // Add changes to table fields here
        field(50102; "SOL Training costs"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
        }
        field(50103; "SOL Training Days"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }
    var
        TrainingFilter: Text;
        Trainings: Record "SOL TrainingParticipants";
        TrainingList: Record "SOL Training";
        Totalcost: Decimal;
        TotalTrainingDays: Integer;

    procedure EmployeeTrainings()

    begin
        TrainingFilter := '';
        Trainings.Reset();
        Trainings.SetRange("Employee No.", Rec."No.");
        if Trainings.FindSet() then begin
            repeat
                if StrPos(TrainingFilter, Trainings."Course No.") = 0 then begin
                    Trainings.SetLoadFields("Course No.");
                    if TrainingFilter <> '' then TrainingFilter += '|';
                    TrainingFilter += Trainings."Course No.";
                end;
            until Trainings.Next = 0;
            TrainingList.SetFilter("No.", TrainingFilter);
            Page.run(Page::"SOL TrainingList", TrainingList);
        end;

    end;

    procedure EmployeeTrainingCosts()

    begin
        TrainingFilter := '';
        Trainings.Reset();
        Trainings.SetRange("Employee No.", Rec."No.");
        if Trainings.FindSet() then begin
            Totalcost := 0;
            repeat
                if StrPos(TrainingFilter, Trainings."Course No.") = 0 then begin
                    Trainings.SetLoadFields("Course No.");
                    if TrainingFilter <> '' then TrainingFilter += '|';
                    TrainingFilter += Trainings."Course No.";
                    TrainingList.Get(Trainings."Course No.");
                    TrainingList.CalcFields("No. of Participants");
                    Totalcost += TrainingList.Fee / TrainingList."No. of Participants";
                    TotalTrainingDays += TrainingList."Training Duration";
                end;
            until Trainings.Next = 0;
            rec."SOL Training costs" := Totalcost;
            Rec."SOL Training Days" := TotalTrainingDays;
        end;
    end;

}