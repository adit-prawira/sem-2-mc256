for i = iter:numel(tVec)   
        
    fprintf("n_iteration = %d\n", i);
    % Convert the reference speeds to world coordinates
    vel = bodyToWorld(ref(:,i-1),post(:,i-1));

    % Perform forward discrete integration step
    post(:,i) = post(:,i-1) + vel*sampleTime;

    % Update lidar and visualization
    ranges = lidar(post(:,i));
    cellRanges = num2cell(ranges);
    [range1, range2, range3, range4, range5, range6, range7] = cellRanges{:};
    if(danger_range(range1, range2, range3, range4, range5, range6, range7))
        fprintf("stop index = %d\n", i);
        post(:, 2)= post(:, i);
        iter = i;
        tVec = iter:sampleTime:(50+iter - 2);
        break;
    end

    fprintf("range1 = %f\nrange2 = %f\nrange3 = %f\nrange4 = %f\nrange5 = %f\nrange6 = %f\nrange7 = %f\n",range1, range2, range3, range4, range5, range6, range7);
    viz(post(:,i),ranges)
    waitfor(r);
end
