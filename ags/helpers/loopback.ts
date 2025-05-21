import { exec } from "astal";

const run_loopback = (state: boolean) => {
  try {
    exec(`ghostty -e "~/.config/scripts/manage_loopback.sh ${state}"`);
  } catch (error) {
    console.log(error);
  }
};

export default run_loopback;
