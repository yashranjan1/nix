import { writeFileAsync, execAsync } from "astal";
import { App } from "astal/gtk3";
import userPath from "../variables/user";

export const splitBar = async (is_split: boolean) => {
  const fileName = is_split ? "split" : "connected";
  const css = `@import "${userPath.get()}/.config/ags/widget/Bar/${fileName}";`;

  try {
    await writeFileAsync(
      `${userPath.get()}/.local/share/ags-editable/bar_style.scss`,
      css,
    );
    await execAsync(["sass", "./style.scss", "/tmp/style.css"]);
    App.reset_css();
    App.apply_css(`/tmp/style.css`);
  } catch (err) {
    print(err);
  }
};
