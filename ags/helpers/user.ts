import { exec, Variable } from "astal";

export default function setUserPath(path: Variable<string>) {
  const username = exec("whoami");
  path.set(`/home/${username}`);
}
