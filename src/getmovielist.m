function movielist = getmovielist(filename, n)
    % GETMOVIELIST: Gets a list of movie names from file.
    % 
    % INPUT
    %   filename  Path of the data file
    %   n         Number of movies to read
    %
    % OUTPUT
    %   movielist  Cell of movie names
    %
    % See also: RECOMMENDSYS
    %
    fid = fopen(filename);
    movielist = cell(n, 1);

    for k = 1:n
        [ix, name] = strtok(fgets(fid), ' ');
        movielist{k} = strtrim(name);
    end

    fclose(fid);
