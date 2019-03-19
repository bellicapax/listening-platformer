using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ShowMap : MonoBehaviour
{
    private const string ON_COLOR_CHANNEL_PREFIX = "OnColor";
    private const string OFF_COLOR_CHANNEL_PREFIX = "OffColor";
    private const string STATUS_CHANNEL_PREFIX = "Status";
    private const string OP_CODE_CHANNEL = "OpCode";
    private const int NUM_BUTTONS = 64;

    private readonly int[] OffColors = new int[]
        {
            1, 7, 10, 15, 23, 35, 47, 51, 55
        };


    [SerializeField] private Button _button;
    [SerializeField] private CsoundUnity _cSound;

    // Start is called before the first frame update
    void Start()
    {
        _button.onClick.AddListener(ShowRandomMap);
    }

    private void ShowRandomMap()
    {
        _cSound.setChannel(OP_CODE_CHANNEL, 1);
        for (int i = 0; i < NUM_BUTTONS; i++)
        {
            _cSound.setChannel(OFF_COLOR_CHANNEL_PREFIX + i, OffColors[Random.Range(0, OffColors.Length)]);
            _cSound.setChannel(STATUS_CHANNEL_PREFIX + i, 144);
        }
    }
}
