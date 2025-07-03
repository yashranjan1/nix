import { exec } from "ags/process";

export default function findUserPath(setPath: (value: string) => void) {
    const username = exec("whoami");
    setPath(`/home/${username}`);
}
