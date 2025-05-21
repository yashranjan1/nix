import { execAsync } from "astal"

export default function HyprPicker(){
    const SCRIPTS_PATH = "/home/yash/.config/scripts";
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
