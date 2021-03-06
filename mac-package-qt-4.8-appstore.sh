# 挂载的volumn的名称
volumn_name='wiznote-disk'
# 挂载点，一般不用修改，只配置volumn_name即可
volumn_path="/Volumes/$volumn_name"

# 以下参数只是用于自定义脚本的行为
package_home="./macos-package"
package_output_path="$HOME"



# compile
mkdir ../WizQTClient-Release-QT4
rm -rf ../WizQTClient-Release-QT4/* && \
cd ../WizQTClient-Release-QT4 && \
cmake -DWIZNOTE_USE_QT5=NO -DCMAKE_BUILD_TYPE=Release -UPDATE_TRANSLATIONS=YES -DAPPSTORE_BUILD=YES -DQMAKE_PREFIX_PATH=/Developer/Tools/Qt/qmake ../WizQTClient && \
make -j3 && \
productbuild --component WizNote.app /Applications --sign "3rd Party Mac Developer Installer: Wei Shijun" wiznote.pkg
