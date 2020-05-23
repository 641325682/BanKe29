function cameraTakePicture() {
    return new Promise((resolve, reject) => {
        navigator.camera.getPicture(onSuccess, onFail, {
            quality: 50,
            destinationType: Camera.DestinationType.DATA_URL,
            cameraDirection: 0
        });

        function onSuccess(imageData) {
            var image = document.getElementById('myImage');
            image.src = "data:image/jpeg;base64," + imageData;
            resolve(imageData)
        }

        function onFail(message) {
            alert('Failed because: ' + message);
            reject(message)
        }
    });
}

export {
    cameraTakePicture
}