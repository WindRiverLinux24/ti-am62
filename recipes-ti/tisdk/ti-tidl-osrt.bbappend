COMPATIBLE_MACHINE:am62axx-evm = "am62axx-evm"
SRC_URI[dlr.sha256sum] = "ec04d394bd1e0a3e7d988f1fa86ed50311fe1a0a957daef4d05e38e821dedec6"

PY_DST_DIR:am62axx-evm = "${D}${libdir}/python3.11/site-packages"
FILES:${PN}:am62axx-evm += "/usr/lib64/*.so*"
FILES:${PN}:am62axx-evm += "${libdir}/python3.11/*"

do_install:am62axx-evm() {
    if [ -e ${S}/tflite/tflite_runtime-2.8.2-cp310-cp310-linux_aarch64.whl ]; then
	mv ${S}/tflite/tflite_runtime-2.8.2-cp310-cp310-linux_aarch64.whl ${S}/tflite/tflite_runtime-2.8.2-cp311-cp311-linux_aarch64.whl
    fi
    pip3 install --no-deps --platform linux_aarch64 ${S}/tflite/tflite_runtime-2.8.2-cp311-cp311-linux_aarch64.whl --target ${PY_DST_DIR} --disable-pip-version-check
    pip3 install  --no-deps --platform linux_aarch64 ${S}/dlr/dlr-1.13.0-py3-none-any.whl  --target ${PY_DST_DIR} --disable-pip-version-check
    if [ -e ${S}/ort/onnxruntime_tidl-1.14.0-cp310-cp310-linux_aarch64.whl ]; then
	mv ${S}/ort/onnxruntime_tidl-1.14.0-cp310-cp310-linux_aarch64.whl ${S}/ort/onnxruntime_tidl-1.14.0-cp311-cp311-linux_aarch64.whl
    fi
    pip3 install  --no-deps --platform linux_aarch64 ${S}/ort/onnxruntime_tidl-1.14.0-cp311-cp311-linux_aarch64.whl  --target ${PY_DST_DIR} --disable-pip-version-check

    install -d ${D}${includedir}
    install -d ${LIB_DST_DIR}

    cp -r ${S}/tfl_lib/tensorflow  ${D}${includedir}/
    cp -r ${S}/tfl_lib/tflite_2.8  ${LIB_DST_DIR}/
    cp ${S}/tfl_lib/libtensorflow-lite.a ${LIB_DST_DIR}/

    cp   ${S}/ort_lib/libonnxruntime.so.1.14.0  ${LIB_DST_DIR}/libonnxruntime.so.1.14.0
    ln -s -r ${LIB_DST_DIR}/libonnxruntime.so.1.14.0 ${LIB_DST_DIR}/libonnxruntime.so
    rm -rf  ${S}/ort_lib/onnxruntime/csharp
    cp -r  ${S}/ort_lib/onnxruntime ${D}${includedir}/

    cp -r ${S}/opencv/opencv-4.2.0  ${D}${includedir}/
}
