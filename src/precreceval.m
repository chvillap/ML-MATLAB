function [bestthresh, bestF1] = precreceval(gtval, testval)
    % PRECRECEVAL: Precision-recall evaluation for multiple thresholds.
    %
    % INPUT
    %   gtval    Ground-truth (expected values)
    %   testval  Test values (observed values)
    % 
    % OUTPUT
    %   bestthresh  Best threshold found
    %   bestF1      Best F1-score found
    %
    narginchk(2, 2);
    nargoutchk(0, 2);

    tmin = min(testval);
    tmax = max(testval);
    tstep = (tmax - tmin) / 1000;

    bestF1 = 0;
    bestthresh = 0;

    for thresh = tmin:tstep:tmax
        cvpredictions = testval < thresh;

        tp = sum((cvpredictions == 1) & (gtval == 1));
        fp = sum((cvpredictions == 1) & (gtval == 0));
        fn = sum((cvpredictions == 0) & (gtval == 1));

        precision = tp / (tp + fp);
        recall = tp / (tp + fn);

        F1 = 2*precision*recall / (precision + recall);

        if F1 > bestF1
            bestF1 = F1;
            bestthresh = thresh;
        end
    end
