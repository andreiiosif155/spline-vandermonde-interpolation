function [x, y] = parse_data(filename)
    fid = fopen(filename, 'r');

    n = fscanf(fid, '%d', 1);
    x = zeros(n + 1, 1);
    y = zeros(n + 1, 1);

    x = fscanf(fid, '%d', n + 1);
    y = fscanf(fid, '%d', n + 1);

    fclose(fid);
end
