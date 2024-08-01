function quizRoom
    % Create a figure for the app
    f = figure('Name', 'MATLAB App', 'Position', [100 100 640 480]);

    % Create the QuizRoomLabel
    uicontrol('Style', 'text', 'String', 'Quiz Room', 'FontSize', 18, ...
              'FontWeight', 'bold', 'Position', [272 417 97 24]);

    % Create the first TextArea and ButtonGroup
    uicontrol('Style', 'text', 'String', 'Who Created the Mona Lisa?', ...
              'Position', [40 329 150 60]);
    bg1 = uibuttongroup('Title', 'Answers', 'Position', [0.1 0.4 0.2 0.2]);
    uicontrol(bg1, 'Style', 'radiobutton', 'String', 'Leonardo da Vinci', ...
              'Position', [10 60 120 22], 'Tag', 'Q1_A1');
    uicontrol(bg1, 'Style', 'radiobutton', 'String', 'Vincent van Gogh', ...
              'Position', [10 38 120 22], 'Tag', 'Q1_A2');
    uicontrol(bg1, 'Style', 'radiobutton', 'String', 'Aristotle', ...
              'Position', [10 16 120 22], 'Tag', 'Q1_A3');

    % Create the second TextArea and ButtonGroup
    uicontrol('Style', 'text', 'String', 'What is the art of Michelangelo that represents the relationship of God and Adam?', ...
              'Position', [247 329 150 60]);
    bg2 = uibuttongroup('Title', 'Answers', 'Position', [0.4 0.4 0.2 0.2]);
    uicontrol(bg2, 'Style', 'radiobutton', 'String', 'Creation of Adam', ...
              'Position', [10 60 120 22], 'Tag', 'Q2_A1');
    uicontrol(bg2, 'Style', 'radiobutton', 'String', 'Relationship of Adam', ...
              'Position', [10 38 120 22], 'Tag', 'Q2_A2');
    uicontrol(bg2, 'Style', 'radiobutton', 'String', 'Adam and God', ...
              'Position', [10 16 120 22], 'Tag', 'Q2_A3');

    % Create the third TextArea and ButtonGroup
    uicontrol('Style', 'text', 'String', 'Who created Sistine Madonna?', ...
              'Position', [459 329 150 60]);
    bg3 = uibuttongroup('Title', 'Answers', 'Position', [0.7 0.4 0.2 0.2]);
    uicontrol(bg3, 'Style', 'radiobutton', 'String', 'Raphael', ...
              'Position', [10 60 120 22], 'Tag', 'Q3_A1');
    uicontrol(bg3, 'Style', 'radiobutton', 'String', 'Michelangelo', ...
              'Position', [10 38 120 22], 'Tag', 'Q3_A2');
    uicontrol(bg3, 'Style', 'radiobutton', 'String', 'David the Goliath', ...
              'Position', [10 16 120 22], 'Tag', 'Q3_A3');

    % Create the Finish Quiz Button
    uicontrol('Style', 'pushbutton', 'String', 'Finish Quiz', ...
              'Position', [271 93 100 22], 'Callback', @calculateQuizScore);

    % Create the Return to Main Hall Button
     uicontrol('Style', 'pushbutton', 'String', 'Return to Main Hall', ...
              'Position', [263 43 117 22], 'Callback', @returnToMainHall);

    % Nested function to calculate the quiz score
    function calculateQuizScore(~, ~)
        totalScore = 0;
        if strcmp(get(get(bg1, 'SelectedObject'), 'Tag'), 'Q1_A1')
            totalScore = totalScore + 1;
        end
        if strcmp(get(get(bg2, 'SelectedObject'), 'Tag'), 'Q2_A1')
            totalScore = totalScore + 1;
        end
        if strcmp(get(get(bg3, 'SelectedObject'), 'Tag'), 'Q3_A1')
            totalScore = totalScore + 1;
        end
        
        % Display the final score
        msgbox(sprintf('Your final score is %d out of 3', totalScore));
    end
    function returnToMainHall(~, ~)
        % Close the current figure
        close(f);

        % Open the mainHall app
        mainHall;
    end
end
