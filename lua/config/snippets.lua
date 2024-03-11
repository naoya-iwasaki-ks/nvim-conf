local ls = require("luasnip")

-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

function firstToUpper(args, parent)
  local str = args[1][1]

  return (str:gsub("^%l", string.upper))
end

function copy(args, parent)
  local str = args[1][1]

  return str
end

ls.add_snippets("javascript", {
  s("sniPerformance", {
    t({ "function calc(name, fn) {", "" }),
    t({ "  console.log(name);", "" }),
    t({ "  const t = performance.now();", "", "" }),
    t({ "  for (const _ of Array(1000000)) {", "" }),
    t({ "    fn()", "" }),
    t({ "  }", "", "" }),
    t({ "  const et = performance.now();", "" }),
    t({ "  console.log('time', et - t);", "" }),
    t({ "}", "" }),
    i(0),
  }),
})

ls.add_snippets("typescript", {
  s("sniRecoilGetter", {
    t({ "export function use" }),
    f(firstToUpper, { 1 }),
    t({ "Value() {", "  return useRecoilValue(" }),
    i(1),
    t({ ")", "}" }),
    i(0),
  }),
  s("sniRecoilSetter", {
    t({ "export function useSet" }),
    f(firstToUpper, { 1 }),
    t({ "() {", "  return useSetRecoilState(" }),
    i(1),
    t({ ")", "}" }),
    i(0),
  }),
  s("sniRecoilSetterOrGetter", {
    t({ "export function use" }),
    f(firstToUpper, { 1 }),
    t({ "() {", "  return useRecoilState(" }),
    i(1),
    t({ ")", "}", "" }),
    t({ "" }),
    t({ "export function use" }),
    f(firstToUpper, { 1 }),
    t({ "Value() {", "  return useRecoilValue(" }),
    f(copy, { 1 }),
    t({ ")", "}", "" }),
    t({ "" }),
    t({ "export function useSet" }),
    f(firstToUpper, { 1 }),
    t({ "() {", "  return useSetRecoilState(" }),
    f(copy, { 1 }),
    t({ ")", "}" }),
    i(0),
  }),
  s("sniState", {
    t({ "const [" }),
    i(1),
    t({ ", set" }),
    f(firstToUpper, { 1 }),
    t({ "] = useState<" }),
    i(2),
    t({ ">(" }),
    i(3),
    t({ ")" }),
    i(0),
  }),
  s("sniMemo", {
    t({ "const " }),
    i(1),
    t({ " = useMemo(() => {", "  " }),
    i(0),
    t({ "", "}, []);" }),
  }),
  s("sniCallback", {
    t({ "const " }),
    i(1),
    t({ " = useCallback(() => {", "  " }),
    i(0),
    t({ "", "}, []);" }),
  }),
  s("sniTranslation", {
    t({ "const { t } = useTranslation()" }),
    i(0),
  }),
})

ls.add_snippets("typescriptreact", {
  s("sniRC", {
    t({ "export function " }),
    i(1),
    t({ "() {", "  return (" }),
    t({ "", "    <div>" }),
    i(0),
    t({ "</div>", "  )" }),
    t({ "", "}" }),
  }),
  s("sniEffect", {
    t({ "useEffect(() => {", "  " }),
    i(0),
    t({ "", "}, []);" }),
  }),
  s("sniTranslation", {
    t({ "const { t } = useTranslation()" }),
    i(0),
  }),
  s("sniState", {
    t({ "const [" }),
    i(1),
    t({ ", set" }),
    f(firstToUpper, { 1 }),
    t({ "] = useState<" }),
    i(2),
    t({ ">(" }),
    i(3),
    t({ ")" }),
    i(0),
  }),
  s("sniMemo", {
    t({ "const " }),
    i(1),
    t({ " = useMemo(() => {", "  " }),
    i(0),
    t({ "", "}, []);" }),
  }),
  s("sniCallback", {
    t({ "const " }),
    i(1),
    t({ " = useCallback(() => {", "  " }),
    i(0),
    t({ "", "}, []);" }),
  }),
})
