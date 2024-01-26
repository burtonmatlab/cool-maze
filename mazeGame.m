%% WRITTEN BY BURTON ZHONG

function mazeGame()
	mazes = {
    	[1 1 1 1 1;
     	1 0 0 0 1;
     	1 0 1 0 1;
     	1 0 0 0 1;
     	1 1 1 1 1];
[
	1, 1, 1, 1, 1, 1, 1, 1, 1, 1;
	1, 0, 0, 1, 0, 0, 0, 0, 0, 1;
	1, 0, 1, 1, 0, 1, 1, 1, 0, 1;
	1, 0, 0, 0, 0, 1, 0, 0, 0, 1;
	1, 1, 1, 1, 0, 1, 0, 1, 0, 1;
	1, 0, 0, 0, 0, 0, 0, 1, 0, 1;
	1, 1, 1, 1, 1, 1, 1, 1, 0, 1;
	1, 0, 0, 0, 0, 0, 0, 0, 0, 1;
	1, 1, 1, 1, 1, 1, 1, 1, 1, 1;
];

    	[1 1 1 1 1 1 1 1 1;
     	1 0 0 0 1 0 0 0 1;
     	1 0 1 0 1 0 1 1 1;
     	1 0 1 0 0 0 0 0 1;
     	1 0 1 1 1 1 1 0 1;
     	1 0 0 0 0 0 0 0 1;
     	1 1 1 1 1 1 1 1 1]
	};

	% menu
	choice = menu('Select a maze', 'Maze 1', 'Maze 2', 'Maze 3');
	if choice == 0
    	return; 
	end

	% select maze
	maze = mazes{choice};

	% Start and end pos
	start = [2, 2];
	goal = [size(maze, 1) - 1, size(maze, 2) - 1];

	% Define the start time
	startTime = tic;

	% make figure
	fig = figure('KeyPressFcn', @keyPress);

	% Draw the maze
	drawMaze();

	function drawMaze()
    	% Create a custom colormap for the maze
    	customColormap = [
        	1, 1, 1; % White for paths
        	0, 0, 0; % Black for walls
        	0.5, 0.5, 0.5; 
    	];

    	% Draw the maze with custom colormap and grid lines
    	imagesc(maze);
    	colormap(customColormap);
    	grid on;
    	set(gca, 'GridColor', 'k'); % grid color to black
    	set(gca, 'GridAlpha', 0.5); %  grid transparency
    	hold on;
    	
        %  start position in green
    	plot(start(2), start(1), 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g');
    	
        %  goal position in red
    	plot(goal(2), goal(1), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
    	hold off;
    	
        % timer 
    	timeElapsed = toc(startTime);
    	title(['Time: ' num2str(round(timeElapsed)) ' seconds']);
	end

	function keyPress(src, event)
    	switch event.Key
        	case 'uparrow'
            	if maze(start(1)-1, start(2)) == 0
                	start(1) = start(1) - 1;
            	end
        	case 'downarrow'
            	if maze(start(1)+1, start(2)) == 0
                	start(1) = start(1) + 1;
            	end
        	case 'leftarrow'
            	if maze(start(1), start(2)-1) == 0
                	start(2) = start(2) - 1;
            	end
        	case 'rightarrow'
            	if maze(start(1), start(2)+1) == 0
                	start(2) = start(2) + 1;
            	end
    	end

    	
    	drawMaze();

    	
    	if isequal(start, goal)
        	timeElapsed = toc(startTime);
        	title(['You win! Time: ' num2str(round(timeElapsed)) ' seconds']);
        	set(fig, 'KeyPressFcn', ''); 
    	end
	end
end



