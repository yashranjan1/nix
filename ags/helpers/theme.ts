import { execAsync, writeFileAsync } from "astal";
import { config, split, theme, themeOpts } from "../variables/theme-variables";
import { App } from "astal/gtk3";
import userPath from "../variables/user";

const EDITS_PATH = `${userPath.get()}/.local/share/ags-editable`;
const SCRIPTS_PATH = `${userPath.get()}/.config/scripts`;

const changeWallpaper = async (path: string) => {
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

  theme.set(themeOpts.get()[newIndex]);
  const colors = config.get().find((t) => t.name === theme.get())?.colors;

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
  App.reset_css();
  App.apply_css(`/tmp/style.css`);

  // write currentTheme.json
  const wallpaperPath = config.get().find((t) => t.name === theme.get())
    ?.wallpaper as string;

  await changeWallpaper(wallpaperPath);
};

export { changeTheme, changeWallpaper };
