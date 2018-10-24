clc; clear; fclose all; close all;

PaperFiles_Path = 'C:\Users\Jolin\Google 雲端硬碟\參考文獻\參考文獻_已分類\暴潮-ReviewPapers';

PaperListName = 'review_try.dat';

cd(PaperFiles_Path);

All_PaperFiles = ls('*.pdf');

Paper_TotalNumbers = size(All_PaperFiles,1);

FileID = fopen(PaperListName,'w');

for i = 1:Paper_TotalNumbers
    
    TMP_LabelPositions = findstr(All_PaperFiles(i,:), '_');
    PDF_LabelPositions = findstr(All_PaperFiles(i,:), '.pdf');
    
    if isempty(PDF_LabelPositions) 
        disp(['Warning: Cannot Find the PDF Label in the paper: ' All_PaperFiles(i,:)]);
        continue;
    end
    
    if isempty(TMP_LabelPositions) 
        disp(['Warning: Cannot Find the Paper Label in the paper: ' All_PaperFiles(i,:)]);
        continue;
    end
    
    if (length(TMP_LabelPositions) < 2 )
        disp(['Warning: Paper Labels are enough to use in the paper: ' All_PaperFiles(i,:)]);
        continue;
    else
        YearLabel_Position   = TMP_LabelPositions(1);
        AuthorLabel_Position = TMP_LabelPositions(2);   
    end
    
    PaperYear  = All_PaperFiles(i,1:YearLabel_Position-1);
    AuthorName = All_PaperFiles(i,YearLabel_Position+1:AuthorLabel_Position-1);
    Papertitle = All_PaperFiles(i,AuthorLabel_Position+1:PDF_LabelPositions-1);
    
    if length(AuthorName) < 15
        AuthorName = [AuthorName blanks(15-length(AuthorName))];
    end
    
    fprintf (FileID, ['    ' PaperYear '    ' AuthorName '  ' Papertitle '\n']);
       
end

fclose(FileID);