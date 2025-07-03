import { createState } from "ags"

const [theme, setTheme] = createState("")
const [split, setSplit] = createState(false)
const [config, setConfig] = createState<Array<Config>>([])
const [themeOpts, setThemeOpts] = createState<Array<string>>([])

export { theme, setTheme, split, setSplit, config, setConfig, themeOpts, setThemeOpts }
