function word= pickwords()
file=fopen('dictionary.txt', 'r');    %open the file as reading format
data=textscan(file, '%s');       % read data and insert them as cell array
fclose(file);                    % close the file
matrixData=[data{:}];            %convert cell array to matrix
randomIndex=randi(length(matrixData),1);    %get a random index from matrixData
word=string(matrixData(randomIndex)).lower; %get a random word and convert it to lower case format
%word=num2cell(char(word));                  %divide the word to letters
end