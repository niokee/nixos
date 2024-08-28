{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = true;
    enableUpdateCheck = true;
    userSettings = {
      "vscode-neovim.neovimExecutablePaths.linux" = "${pkgs.neovim}/bin/nvim";
      "direnv.path.executable" = "${pkgs.direnv}/bin/direnv";
      "[python]" = {
        "editor.defaultFormatter" = "charliermarsh.ruff";

        "editor.codeActionsOnSave" = {
          "source.organizeImports" = "explicit";
        };
      };

      "python.languageServer" = "Pylance";

      "python.analysis.typeCheckingMode" = "basic";

      "python.analysis.diagnosticMode" = "openFilesOnly";

      "editor.formatOnSave" = true;

      "python.defaultInterpreterPath" = ".\\.venv\\Scripts\\python.exe";

      "python.terminal.activateEnvironment" = true;

      "editor.rulers" = [80 120];

      # Optional settings

      "python.analysis.autoImportCompletions" = true;

      "python.analysis.enablePytestSupport" = true;

      "python.analysis.autoFormatString" = true;

      # ----- VS Code settings ------

      "workbench.colorTheme" = "Kanagawa";

      "git.enableSmartCommit" = true;

      "workbench.colorCustomizations" = {
        "editorRuler.foreground" = "#333333";
      };

      "python.analysis.extraPaths" = [];

      "editor.lineNumbers" = "relative";

      "workbench.editor.showTabs" = "single";

      "editor.cursorSurroundingLines" = 8;
      "task.allowAutomaticTasks" = "on";

      "[json]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };

      "editor.minimap.enabled" = false;

      "explorer.confirmDragAndDrop" = false;

      "gitlens.graph.minimap.dataType" = "lines";

      "gitlens.graph.layout" = "editor";

      "gitlens.currentLine.format" = "''\${author,  }$''\{date}$''\{' via 'pullRequest}$''\{ • message|50?}";

      "gitlens.statusBar.format" = "$''\{author},  $''\{date}$''\{' via 'pullRequest}";

      "gitlens.blame.format" = "''\${message|50?} ''\${date|14-}";

      "gitlens.views.formats.commits.description" = "$''\{author,  }$''\{date}";

      "gitlens.views.formats.stashes.description" = "$''\{stashOnRef,  }''\${date}";

      "[markdown]" = {
        "editor.defaultFormatter" = "yzhang.markdown-all-in-one";
      };

      "editor.stickyScroll.enabled" = false;

      "workbench.preferredDarkColorTheme" = "Kanagawa";

      "workbench.preferredHighContrastColorTheme" = "Kanagawa";

      "editor.largeFileOptimizations" = false;

      "files.associations" = {
        "*.csv" = "csv";
      };

      "github.copilot.enable" = {
        "*" = false;

        "plaintext" = false;

        "markdown" = false;

        "scminput" = false;
      };

      "window.enableMenuBarMnemonics" = false;
      "extensions.experimental.affinity" = {
        "asvetliakov.vscode-neovim" = 1;
      };
    };
    extensions = with pkgs.vscode-extensions; [
      charliermarsh.ruff
      ms-python.python
      ms-python.vscode-pylance
      njpwerner.autodocstring
      eamodio.gitlens
      catppuccin.catppuccin-vsc
      ms-toolsai.jupyter
      asvetliakov.vscode-neovim
      ban.spellright
      mkhl.direnv
    ];
  };
}
