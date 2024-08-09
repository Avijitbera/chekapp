package com.example.checkapp.service;

import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.IBinder;
import android.util.Log;
import android.widget.Toast;

import androidx.annotation.Nullable;

public class DetectInstall extends BroadcastReceiver {



    @Override
    public void onReceive(Context context, Intent intent) {
        Log.d("BACKGROUND", "THIS IS FROM BACKGROUND");
        Toast.makeText(context, "From Background", Toast.LENGTH_SHORT).show();
        if(intent.getAction() == Intent.ACTION_PACKAGE_ADDED){
            Toast.makeText(context, "From Background Package", Toast.LENGTH_SHORT).show();
        }

    }


}
