# 运行时获取当前系统时间作为build版本号
# 不要将此文件加入到工程文件中，放在工程根目录下即可

## 工程中加入Settings.bundle并设置如图settings-bundle.png
## 在启动后设置如下
## 注意key需要对应Settings.bundle中的Identifier
# NSString *version = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
# [[NSUserDefaults standardUserDefaults] setObject:version forKey:@"version_preference"];
# NSString *build = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
# [[NSUserDefaults standardUserDefaults] setObject:build forKey:@"build_preference"];
# NSString *githash = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"GITHash"];
# [[NSUserDefaults standardUserDefaults] setObject:githash forKey:@"githash_preference"];
# [[NSUserDefaults standardUserDefaults] synchronize];

# 在DerivedData目录下～/Library/Developer/Xcode/DerivedData的
# /EXECUTABLE_NAME-xxx/Build/Products/Debug-iphoneos/EXECUTABLE_NAME.app/Info.plist
# /EXECUTABLE_NAME-xxx/Build/Products/Debug-iphoneos/EXECUTABLE_NAME.app/Settings.bundle
# /EXECUTABLE_NAME-xxx/Build/Products/Debug-iphoneos/EXECUTABLE_NAME.app.dSYM

# 如果命令执行时以非零值返回(即有错误),立即退出
# 你写的每个脚本都应该在文件开头加上set -e
# 这句语句告诉bash如果任何语句的执行结果不是true则应该退出。
# 这样的好处是防止错误像滚雪球般变大导致一个致命的错误，
# 而这些错误本应该在之前就被处理掉。
# 如果要增加可读性，可以使用set -o errexit，它的作用与set -e相同。
set -e

# 在参数扩展时，将未设置的的变量以错误对待。
# 如果在未设置的变量上扩展，shell会打印错误信息，如果没有交互，以一个非0状态退出。
# 因为不需要输入参数，所以打开此处
set -u

# 获取系统时间，形如“201603101434”
build_time=`date "+%Y%m%d%H%M"`

# Info.plist文件路径
# 工程目录的: "${PROJECT_DIR}/${INFOPLIST_FILE}" 
# 编译目录的: ${TARGET_BUILD_DIR}/${EXECUTABLE_NAME}.app/Info.plist
# 未知目录的: "$INFOPLIST_FILE"
PLIST_PATH=${PRODUCT_SETTINGS_PATH}

# 获取执行程序文件路径
PLIST_BUDDY="/usr/libexec/PlistBuddy"

# 将build_time设置到plist文件中(注意是build生成的，还是工程目录的)
# 可以将release版本和debug版本区分开来分别设置
$PLIST_BUDDY -c "Set :CFBundleVersion $build_time" $PLIST_PATH

# 获取所在工程git的commitid（最少4位）
# git rev-parse --short HEAD (取前7位)
# git rev-parse --short=12 HEAD (取前12位)
# git rev-parse HEAD (取全部)
GITREV_SHA=$(git --git-dir="${PROJECT_DIR}/../.git" --work-tree="${PROJECT_DIR}/../" rev-parse --short=12 HEAD)
$PLIST_BUDDY  -c "Set :GITHash $GITREV_SHA" $PLIST_PATH
echo "GITHash: ${GITREV_SHA})"