{
	"contents": {
		"dd55022a-f71f-4aee-9469-56be0b258b90": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "tl_myfirstworkflow",
			"subject": "TL_myFirstWorkflow",
			"customAttributes": [{
				"id": "username",
				"label": "User name",
				"type": "string",
				"value": "${context.empData.personalInfo.username}"
			}, {
				"id": "division",
				"label": "division",
				"type": "string",
				"value": "${context.empData.personalInfo.division}"
			}, {
				"id": "country",
				"label": "Country",
				"type": "string",
				"value": "${context.empData.personalInfo.country}"
			}, {
				"id": "jonTitle",
				"label": "Job Title",
				"type": "string",
				"value": "${context.empData.personalInfo.jobTitle}"
			}],
			"name": "TL_myFirstWorkflow",
			"documentation": "Tim",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "StartEvent1"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "EndEvent1"
				}
			},
			"activities": {
				"4d7aab50-3478-4134-b06d-ab8ba4d91c8d": {
					"name": "Pepare Roles"
				},
				"f1537f2c-dbff-483e-ab4a-0523fd470809": {
					"name": "EnrichContent"
				},
				"d43f0dd6-78bf-4531-94ec-a5b713c1ac70": {
					"name": "Determine Equ"
				},
				"a7bb07e2-b98f-4708-9660-88d24b8fde8b": {
					"name": "Change or confirm Equipment"
				},
				"c841ee96-9e94-4f2c-81ee-5e8024252d33": {
					"name": "approve Equipment"
				},
				"d4e29025-2144-46e9-b5ab-8240bd9073cf": {
					"name": "IsApproved"
				},
				"8ff7c3a6-fbda-438d-92fe-4859f03fe1a4": {
					"name": "Accept Workplace for new Hire"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"d1dcd924-541c-4843-bc9c-50bc478d5f2d": {
					"name": "SequenceFlow2"
				},
				"e9c2dd51-b887-4d56-b6f9-0bff53d3e68b": {
					"name": "SequenceFlow3"
				},
				"657f016c-2ddc-40db-82cc-823848f409bd": {
					"name": "SequenceFlow4"
				},
				"5a6c0572-31ff-4900-a561-fdb538f04fa4": {
					"name": "SequenceFlow6"
				},
				"4e72112b-210c-4ca3-a0f8-22a56d8ac698": {
					"name": "SequenceFlow8"
				},
				"0f6e6d0c-4b31-4085-b2b0-a91df7e6e7fa": {
					"name": "Rejected"
				},
				"92b2d520-6e4c-4575-8c2f-ada3b92ce7d8": {
					"name": "IsApproved"
				},
				"d5ba24d8-4429-4efe-a376-b0293e01569d": {
					"name": "SequenceFlow12"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1",
			"sampleContextRefs": {
				"3b8637e1-eaa1-4851-a174-e8ec43039153": {}
			}
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"4d7aab50-3478-4134-b06d-ab8ba4d91c8d": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/PrepareRulesPayload.js",
			"id": "scripttask1",
			"name": "Pepare Roles"
		},
		"f1537f2c-dbff-483e-ab4a-0523fd470809": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/EnrichContext.js",
			"id": "scripttask2",
			"name": "EnrichContent"
		},
		"d43f0dd6-78bf-4531-94ec-a5b713c1ac70": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "BUSINESS_RULES",
			"path": "/rules-service/rest/v2/rule-services",
			"httpMethod": "POST",
			"requestVariable": "${context.rulesPayload}",
			"responseVariable": "${context.equipment.EquipmentsInfo}",
			"id": "servicetask1",
			"name": "Determine Equ"
		},
		"a7bb07e2-b98f-4708-9660-88d24b8fde8b": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Confirm or Change Equipment for ${context.empData.d.results[0].firstName} ${context.empData.d.results[0].lastName}",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${context.empData.buddies}, ${info.startedBy}",
			"formReference": "/scripts/TL_myFirstWorkflow/ConfirmOrChangeEquipment.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "ConfirmOrChangeEquipment"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask1",
			"name": "Change or confirm Equipment"
		},
		"c841ee96-9e94-4f2c-81ee-5e8024252d33": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Approve Equipment for ${context.empData.d.results[0].firstName} ${context.empData.d.results[0].lastName}",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${context.empData.buddies}, ${info.startedBy}",
			"formReference": "/scripts/TL_myFirstWorkflow/ApproveEquipment.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "ApproveEquipment"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask2",
			"name": "approve Equipment"
		},
		"d4e29025-2144-46e9-b5ab-8240bd9073cf": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "IsApproved",
			"default": "92b2d520-6e4c-4575-8c2f-ada3b92ce7d8"
		},
		"8ff7c3a6-fbda-438d-92fe-4859f03fe1a4": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Accept Workplace for ${context.empData.d.results[0].firstName} ${context.empData.d.results[0].lastName}",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${context.empData.buddies}, ${info.startedBy}",
			"formReference": "/scripts/TL_myFirstWorkflow/AcceptWorkplace.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "AcceptWorkplace"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask3",
			"name": "Accept Workplace for new Hire"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "4d7aab50-3478-4134-b06d-ab8ba4d91c8d"
		},
		"d1dcd924-541c-4843-bc9c-50bc478d5f2d": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "4d7aab50-3478-4134-b06d-ab8ba4d91c8d",
			"targetRef": "d43f0dd6-78bf-4531-94ec-a5b713c1ac70"
		},
		"e9c2dd51-b887-4d56-b6f9-0bff53d3e68b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow3",
			"name": "SequenceFlow3",
			"sourceRef": "d43f0dd6-78bf-4531-94ec-a5b713c1ac70",
			"targetRef": "f1537f2c-dbff-483e-ab4a-0523fd470809"
		},
		"657f016c-2ddc-40db-82cc-823848f409bd": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow4",
			"name": "SequenceFlow4",
			"sourceRef": "f1537f2c-dbff-483e-ab4a-0523fd470809",
			"targetRef": "a7bb07e2-b98f-4708-9660-88d24b8fde8b"
		},
		"5a6c0572-31ff-4900-a561-fdb538f04fa4": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow6",
			"name": "SequenceFlow6",
			"sourceRef": "a7bb07e2-b98f-4708-9660-88d24b8fde8b",
			"targetRef": "c841ee96-9e94-4f2c-81ee-5e8024252d33"
		},
		"4e72112b-210c-4ca3-a0f8-22a56d8ac698": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow8",
			"name": "SequenceFlow8",
			"sourceRef": "c841ee96-9e94-4f2c-81ee-5e8024252d33",
			"targetRef": "d4e29025-2144-46e9-b5ab-8240bd9073cf"
		},
		"0f6e6d0c-4b31-4085-b2b0-a91df7e6e7fa": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask1.last.decision==\"reject\"}",
			"id": "sequenceflow10",
			"name": "Rejected",
			"sourceRef": "d4e29025-2144-46e9-b5ab-8240bd9073cf",
			"targetRef": "a7bb07e2-b98f-4708-9660-88d24b8fde8b"
		},
		"92b2d520-6e4c-4575-8c2f-ada3b92ce7d8": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow11",
			"name": "IsApproved",
			"sourceRef": "d4e29025-2144-46e9-b5ab-8240bd9073cf",
			"targetRef": "8ff7c3a6-fbda-438d-92fe-4859f03fe1a4"
		},
		"d5ba24d8-4429-4efe-a376-b0293e01569d": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow12",
			"name": "SequenceFlow12",
			"sourceRef": "8ff7c3a6-fbda-438d-92fe-4859f03fe1a4",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"dc1c3026-861e-465b-b5d6-1d13ec354734": {},
				"29f72c1a-56af-4b34-8be2-035d07819f4a": {},
				"bd56156b-94a9-48d7-865a-a0a0ab4bf57c": {},
				"24ba8cb9-5a11-42d5-b3f9-3aa27a23553f": {},
				"006b90b4-6666-42a8-b452-3b9fb68a470a": {},
				"0a22220f-1565-4bae-87a6-c31603cf6d5d": {},
				"5a46e8a3-db43-4c76-827f-2c8321256ea7": {},
				"9e21d159-2dd7-4831-9315-da6885935c42": {},
				"bb10379d-27b6-4dbb-bfce-f51cce0ea222": {},
				"0a8f7397-cfd5-469b-9157-8bd8afa4c3c9": {},
				"4f32a07a-2b7f-40fb-b281-a527bd87c5ef": {},
				"668f57d4-90ab-40a2-873c-82ccf5ff4542": {},
				"76d77868-73f1-4dec-afed-e34342dc9276": {},
				"04ce0c79-639f-4e01-883d-40678a3e6080": {},
				"fbbfa163-5a0e-4919-a13f-1b803fccc7da": {}
			}
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 80,
			"y": 90,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 948,
			"y": -117,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "96,103 208,103",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "dc1c3026-861e-465b-b5d6-1d13ec354734",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"dc1c3026-861e-465b-b5d6-1d13ec354734": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 158,
			"y": 70,
			"width": 100,
			"height": 60,
			"object": "4d7aab50-3478-4134-b06d-ab8ba4d91c8d"
		},
		"29f72c1a-56af-4b34-8be2-035d07819f4a": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "208,100 335,100",
			"sourceSymbol": "dc1c3026-861e-465b-b5d6-1d13ec354734",
			"targetSymbol": "24ba8cb9-5a11-42d5-b3f9-3aa27a23553f",
			"object": "d1dcd924-541c-4843-bc9c-50bc478d5f2d"
		},
		"bd56156b-94a9-48d7-865a-a0a0ab4bf57c": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 419,
			"y": 70,
			"width": 100,
			"height": 60,
			"object": "f1537f2c-dbff-483e-ab4a-0523fd470809"
		},
		"24ba8cb9-5a11-42d5-b3f9-3aa27a23553f": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 285,
			"y": 70,
			"width": 100,
			"height": 60,
			"object": "d43f0dd6-78bf-4531-94ec-a5b713c1ac70"
		},
		"006b90b4-6666-42a8-b452-3b9fb68a470a": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "335,100 469,100",
			"sourceSymbol": "24ba8cb9-5a11-42d5-b3f9-3aa27a23553f",
			"targetSymbol": "bd56156b-94a9-48d7-865a-a0a0ab4bf57c",
			"object": "e9c2dd51-b887-4d56-b6f9-0bff53d3e68b"
		},
		"0a22220f-1565-4bae-87a6-c31603cf6d5d": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "469,100 610,100",
			"sourceSymbol": "bd56156b-94a9-48d7-865a-a0a0ab4bf57c",
			"targetSymbol": "5a46e8a3-db43-4c76-827f-2c8321256ea7",
			"object": "657f016c-2ddc-40db-82cc-823848f409bd"
		},
		"5a46e8a3-db43-4c76-827f-2c8321256ea7": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 560,
			"y": 70,
			"width": 100,
			"height": 60,
			"object": "a7bb07e2-b98f-4708-9660-88d24b8fde8b"
		},
		"9e21d159-2dd7-4831-9315-da6885935c42": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 763,
			"y": -27,
			"width": 100,
			"height": 60,
			"object": "c841ee96-9e94-4f2c-81ee-5e8024252d33"
		},
		"bb10379d-27b6-4dbb-bfce-f51cce0ea222": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "610,100 711.75,100 711.75,2 795,2",
			"sourceSymbol": "5a46e8a3-db43-4c76-827f-2c8321256ea7",
			"targetSymbol": "9e21d159-2dd7-4831-9315-da6885935c42",
			"object": "5a6c0572-31ff-4900-a561-fdb538f04fa4"
		},
		"0a8f7397-cfd5-469b-9157-8bd8afa4c3c9": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 792,
			"y": 79,
			"object": "d4e29025-2144-46e9-b5ab-8240bd9073cf"
		},
		"4f32a07a-2b7f-40fb-b281-a527bd87c5ef": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "813,3 813,100",
			"sourceSymbol": "9e21d159-2dd7-4831-9315-da6885935c42",
			"targetSymbol": "0a8f7397-cfd5-469b-9157-8bd8afa4c3c9",
			"object": "4e72112b-210c-4ca3-a0f8-22a56d8ac698"
		},
		"668f57d4-90ab-40a2-873c-82ccf5ff4542": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "813,100 726,100 726,112 615,112",
			"sourceSymbol": "0a8f7397-cfd5-469b-9157-8bd8afa4c3c9",
			"targetSymbol": "5a46e8a3-db43-4c76-827f-2c8321256ea7",
			"object": "0f6e6d0c-4b31-4085-b2b0-a91df7e6e7fa"
		},
		"76d77868-73f1-4dec-afed-e34342dc9276": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 921,
			"y": 76,
			"width": 100,
			"height": 60,
			"object": "8ff7c3a6-fbda-438d-92fe-4859f03fe1a4"
		},
		"04ce0c79-639f-4e01-883d-40678a3e6080": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "813,99 971,99",
			"sourceSymbol": "0a8f7397-cfd5-469b-9157-8bd8afa4c3c9",
			"targetSymbol": "76d77868-73f1-4dec-afed-e34342dc9276",
			"object": "92b2d520-6e4c-4575-8c2f-ada3b92ce7d8"
		},
		"fbbfa163-5a0e-4919-a13f-1b803fccc7da": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "968.25,106 968.25,-99.5",
			"sourceSymbol": "76d77868-73f1-4dec-afed-e34342dc9276",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "d5ba24d8-4429-4efe-a376-b0293e01569d"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"hubapireference": 1,
			"sequenceflow": 12,
			"startevent": 1,
			"endevent": 1,
			"usertask": 3,
			"servicetask": 1,
			"scripttask": 2,
			"exclusivegateway": 1
		},
		"3b8637e1-eaa1-4851-a174-e8ec43039153": {
			"classDefinition": "com.sap.bpm.wfs.SampleContext",
			"reference": "/workflows/SampleInputContext.json",
			"id": "default-start-context"
		}
	}
}