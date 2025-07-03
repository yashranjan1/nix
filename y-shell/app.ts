import app from "ags/gtk3/app";
import Bar from "@Bar/Bar";
import { exec, execAsync, } from "ags/process";
import { readFileAsync } from "ags/file";
import { createState } from "ags";
import PowerMenu from "@Power/PowerMenu";
import ControlCenter from "@CC/ControlCenter";
import AppLauncher from "@/AppLauncher/AppLauncher";
import NotificationPopups from "@/Notification/Popups";
import CalendarCenter from "@/CalendarCenter/CalendarCenter";
import NotificationCenter from "@/NotificationCenter/NotificationCenter";
import { setConfig, setSplit, setTheme, setThemeOpts } from "./variables/theme-variables";
import VolumeControl from "@/VolumeControl/VolumeControl";
import WifiMenu from "@/WifiMenu/WifiMenu";
import NewNetwork from "@/NewNetwork/NewNetwork";
import findUserPath from "./helpers/user";
import { userPath, setUserPath } from "./variables/user";
import Gdk from "gi://Gdk?version=3.0";

exec(["sass", "./style.scss", "/tmp/style.css"]);

findUserPath(setUserPath);

// config creation

await readFileAsync(
    `${userPath.get()}/.local/share/ags-editable/currentTheme.json`,
).then((data: string) => {
    const parsed: { name: string; split: boolean } = JSON.parse(data);
    setTheme(parsed.name);
    setSplit(parsed.split);
});

await execAsync([
    "zsh",
    "-c",
    "$(realpath ~/.config/scripts/theme_generator.sh)",
]).then(async (data: string) => {
    const parsed: Array<Config> = JSON.parse(data);
    setConfig(parsed);

    setThemeOpts(parsed.map((t) => t.name));
});

const [menuState, setMenuState] = createState<string>("none");

app.start({
    requestHandler(request: string, res: (response: any) => void) {
        if (request.startsWith("none")) {
            setMenuState("none");
            res("closed!");
        }

        if (request.startsWith("app-launcher")) {
            const newValue: string =
                "app-launcher-" +
                app.get_monitors()[Number(request.split("-")[2])].get_model();
            if (newValue === menuState.get()) {
                setMenuState("none");
                res("closed!");
                return;
            }
            setMenuState(newValue);
            res("opened!");
        }
    },
    css: "/tmp/style.css",
    icons: `${SRC}/icons`,
    main() {
        app.get_monitors().map((monitor: Gdk.Monitor) => {
            Bar({ gdkmonitor: monitor, menuState: menuState });
        });
        app.get_monitors().map((monitor: Gdk.Monitor) => {
            CalendarCenter({ gdkmonitor: monitor, menuState: menuState });
        });
        app.get_monitors().map((monitor: Gdk.Monitor) => {
            PowerMenu({ gdkmonitor: monitor, menuState: menuState });
        });
        app.get_monitors().map((monitor: Gdk.Monitor) => {
            ControlCenter({ gdkmonitor: monitor, menuState: menuState });
        });
        app.get_monitors().map((monitor: Gdk.Monitor) => {
            AppLauncher({ gdkmonitor: monitor, menuState: menuState });
        });
        app.get_monitors().map((monitor: Gdk.Monitor) => {
            NotificationCenter({ gdkmonitor: monitor, menuState: menuState });
        });
        app.get_monitors().map((monitor: Gdk.Monitor) => {
            VolumeControl({ gdkmonitor: monitor, menuState: menuState });
        });
        app.get_monitors().map((monitor: Gdk.Monitor) => {
            WifiMenu({ gdkmonitor: monitor, menuState: menuState });
        });
        app.get_monitors().map((monitor: Gdk.Monitor) => {
            NewNetwork({ gdkmonitor: monitor, menuState: menuState });
        });
        NotificationPopups(app.get_monitors()[0]);
    },
});

export { menuState, setMenuState }
