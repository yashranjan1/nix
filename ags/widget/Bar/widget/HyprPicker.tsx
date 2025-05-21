import { execAsync } from "astal"
import userPath from "../../../variables/user";

export default function HyprPicker(){
    const SCRIPTS_PATH = `${userPath.get()}/.config/scripts`;
    const onClick = async () => {
        try {
            await execAsync(`${SCRIPTS_PATH}/color_picker.sh`)
        }
        catch (err) {
            console.log(err)
        }
    }
    
    return  <button 
        className={"control-center-btn"}
        onClick={onClick}
    >
        <icon icon="color-select-symbolic" />
    </button>
}
