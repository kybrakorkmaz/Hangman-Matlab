letterSet=java.util.HashSet();
lives=6;
hiddenWord=pickwords();
fprintf(hiddenWord);
fprintf('\n');
str='';
userAns="";
flag=0;
h_word=hiddenWord;
hiddenWord=num2cell(char(hiddenWord));
val=0;

for i=1:length(hiddenWord)
    str=append(str, '_');
end

fprintf("*******Word******\n");
fprintf(str);
fprintf("\n");

while lives ~= 0
    drawHangman(lives)
    if(str == h_word)
        fprintf("You won!\n")
        break
    end
    %if user entered "hint" word to input section, show the secret word,
    %break the loop
    %take a guess from user 
    userAns=input('Write a guess: ', 's');
    
    is_letter=isletter(userAns);
    if is_letter==0
        fprintf("invalid character, enter a letter!\n");
    end
    if(userAns == "hint")
        fprintf("Hidden word is %s\nGame Over!\n", h_word);
        break
    end
     %if the user wants to guess the word not as a letter, as word, take the
    %guess and if the guess is true, break the loop.
    if(userAns== "guess")
        userAns=input('What is your guess? ', 's');
        if(h_word==userAns)
            fprintf("You won!\n");
            break
        end
        is_letter=1;
    end
    %if the hashset first time encounter the letter, does not have before
    %if hashset not empty
    if isempty(letterSet)==0 && is_letter==1
        %search the hashset has this letter or not,
        %if it has, flag is logical 1 if not flag is logical 0
        flag=contains(letterSet,userAns);
        if flag == 1
            %inform user, user already guessed this letter, prevent
            %repeating guess
            fprintf("You used that letter before\n");  
        else
            letterSet.add(userAns); %add letter into hashset  
        end
    else
        letterSet.add(userAns); %add letter into hashset
    end

    if(flag == 0 && is_letter==1)
        %check the word has this letter or not
        check_w=contains(hiddenWord,userAns);
        %if the word does not have this letter
        if(check_w == 0)
            %decrease the lives by one
            lives=lives-1;
        end
        %replace empty space with guessed letters
        for i =1:length(hiddenWord)
            if(userAns==hiddenWord{i})
                str(1,i)= userAns;
            end
        end
        fprintf("*******Word******\n");
        fprintf(str);
        fprintf("\n");
    end
   
end
if lives==0
    drawHangman(lives)
    fprintf("You lost!\n");
end
pause(1);
close all;