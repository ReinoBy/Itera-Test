tableextension 50101 "HumanResoursesTableExtension" extends "Human Resources Setup"
{
    fields
    {
        field(50101; "SOL Training No."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }


}