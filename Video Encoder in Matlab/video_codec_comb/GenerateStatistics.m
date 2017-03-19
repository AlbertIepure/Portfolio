function[intraMvHistogram,intraEfHistogram,intraDeMvHistogram,intraHpMvHistogram,intraHpEfHistogram,intraCsEfHistogram,intraDeHpMvHistogram,intraDeHpEfHistogram] = GenerateStatistics(mbDim,Q,mvSearchRange,currentFrame,referenceFrame)
    [intraMvHistogram,intraEfHistogram] =  InterCodingStatistics(mbDim,Q,mvSearchRange,currentFrame,referenceFrame,false,false,false,false);
    [intraDeMvHistogram,~] =  InterCodingStatistics(mbDim,Q,mvSearchRange,currentFrame,referenceFrame,true,false,false,false);
    [intraHpMvHistogram,intraHpEfHistogram] =  InterCodingStatistics(mbDim,Q,mvSearchRange,currentFrame,referenceFrame,false,false,true,false);
    [~,intraCsEfHistogram] =  InterCodingStatistics(mbDim,Q,mvSearchRange,currentFrame,referenceFrame,false,false,false,true);
    [intraDeHpMvHistogram,intraDeHpEfHistogram] =  InterCodingStatistics(mbDim,Q,mvSearchRange,currentFrame,referenceFrame,true,false,true,false);
end