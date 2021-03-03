codeunit 50101 "SOL InstallCode"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    begin
        InsertBook('0001', 'November', 'kivirähk', 200);
        InsertBook('0005', 'Baas in five minutes', 'betty', 207);
    end;

    local procedure InsertBook(BookNo: Code[20]; BookTitle: Text; BookAuthor: Text; BookPageCount: Integer)
    var
        Book: Record "SOL Book";
    begin
        with Book do begin
            if Get(BookNo) then
                exit;
            "No." := BookNo;
            Author := BookAuthor;
            Hardcover := Hardcover;
            Title := BookTitle;
            "Page count" := BookPageCount;

            Insert;

        end;
    end;
}