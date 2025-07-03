import { execAsync } from "ags/process";
import { writeFileAsync } from "ags/file";
import { config, setTheme, split, theme, themeOpts } from "../variables/theme-variables";
import app from "ags/gtk3/app";
import { userPath } from "../variables/user";

const changeWallpaper = async (path: string) => {
    const EDITS_PATH = `${userPath.get()}/.local/share/ags-editable`;
    const SCRIPTS_PATH = `${userPath.get()}/.config/scripts`;
    writeFileAsync(
        `${EDITS_PATH}/currentTheme.json`,
        JSON.stringify({ name: theme.get(), split: split.get() }),
    );
    await execAsync(`${SCRIPTS_PATH}/run_swww.sh ${path}`);
};

const changeTheme = async (num: number) => {
    // set variables
    const oldIndex = themeOpts.get().indexOf(theme.get());

    let newIndex = (oldIndex + num) % themeOpts.get().length;

    if (newIndex < 0) {
        newIndex = themeOpts.get().length - 1;
    }

    setTheme(themeOpts.get()[newIndex]);
    const colors = config.get().find((t) => t.name === theme.get())?.colors;
    const EDITS_PATH = `${userPath.get()}/.local/share/ags-editable`;

    // write theme.scss
    try {
        await writeFileAsync(
            `${EDITS_PATH}/theme.scss`,
            `$accent: ${colors?.accent};
$theme_fg_color: ${colors?.theme_fg_color};
$theme_bg_color: ${colors?.theme_bg_color};
$inactive-ws: ${colors?.inactiveWs};
$theme_alt_bg_color: ${colors?.theme_alt_bg_color};
$red: ${colors?.red};
$yellow: ${colors?.yellow};
$green: ${colors?.green};
$purple: ${colors?.purple};`,
        );
    } catch (err) {
        console.log(err);
    }

    // apply theme.scss
    await execAsync(["sass", "./style.scss", "/tmp/style.css"]);
    app.reset_css();
    app.apply_css(`/tmp/style.css`);

    // write currentTheme.json
    const wallpaperPath = config.get().find((t) => t.name === theme.get())
        ?.wallpaper as string;

    await changeWallpaper(wallpaperPath);
};

export { changeTheme, changeWallpaper };
