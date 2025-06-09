{
  git = {
    git-conflict = {
      mappings = {
        both = null;
        nextConflict = null;
        none = null;
        ours = null;
        prevConflict = null;
        theirs = null;
      };
    };
    enable = true;
    gitsigns = {
      mappings = {
        blameLine = null;
        diffProject = null;
        diffThis = null;
        nextHunk = null;
        previousHunk = null;
        previewHunk = null;
        resetBuffer = null;
        resetHunk = null;
        stageBuffer = null;
        stageHunk = null;
        toggleBlame = null;
        toggleDeleted = null;
        undoStageHunk = null;
      };
      enable = true;
      codeActions.enable = true;
      setupOpts = {
        "signs" = {
          "add" = {"text" = "+";};
          "change" = {"text" = "~";};
          "delete" = {"text" = "_";};
          "topdelete" = {"text" = "‾";};
          "changedelete" = {"text" = "~";};
        };
      };
    };
  };
}
