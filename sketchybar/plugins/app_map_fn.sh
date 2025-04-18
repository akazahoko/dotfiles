function app_map() {
  case "$1" in
  "Microsoft OneNote")
    app_result="OneNote"
    ;;
  *)
    app_result="$1"
    ;;
  esac
}

app_map "$1"
echo "$app_result"
