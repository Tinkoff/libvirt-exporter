// Copyright 2017 Kumina, https://kumina.nl/
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package libvirtSchema

type Domain struct {
	Devices  Devices  `xml:"devices"`
	Metadata Metadata `xml:"metadata"`
}

type Metadata struct {
	NovaInstance Instance `xml:"instance"`
}

type Instance struct {
	NovaFlavor Flavor `xml:"flavor"`
	NovaOwner  Owner  `xml:"owner"`
	NovaName   string `xml:"name"`
	NovaRoot   Root   `xml:"root"`
}

type Flavor struct {
	FlavorName string `xml:"name,attr"`
}

type Owner struct {
	NovaUser    User    `xml:"user"`
	NovaProject Project `xml:"project"`
}

type User struct {
	UserName string `xml:",chardata"`
	UserUUID string `xml:"uuid,attr"`
}

type Project struct {
	ProjectName string `xml:",chardata"`
	ProjectUUID string `xml:"uuid,attr"`
}

type Root struct {
	RootType string `xml:"type,attr"`
	RootUUID string `xml:"uuid,attr"`
}

type Devices struct {
	Disks      []Disk      `xml:"disk"`
	Interfaces []Interface `xml:"interface"`
}

type Disk struct {
	Device   string     `xml:"device,attr"`
	Driver   DiskDriver `xml:"driver"`
	Source   DiskSource `xml:"source"`
	Target   DiskTarget `xml:"target"`
	DiskType string     `xml:"type,attr"`
	Serial   string     `xml:"serial"`
}

type DiskDriver struct {
	Type    string `xml:"type,attr"`
	Cache   string `xml:"cache,attr"`
	Discard string `xml:"discard,attr"`
}

type DiskSource struct {
	File string `xml:"file,attr"`
	Name string `xml:"name,attr"`
}

type DiskTarget struct {
	Device string `xml:"dev,attr"`
	Bus    string `xml:"bus,attr"`
}

type Interface struct {
	Source      InterfaceSource      `xml:"source"`
	Target      InterfaceTarget      `xml:"target"`
	Virtualport InterfaceVirtualPort `xml:"virtualport"`
}

type InterfaceVirtualPort struct {
	Parameters InterfaceVirtualPortParam `xml:"parameters"`
}
type InterfaceVirtualPortParam struct {
	InterfaceID string `xml:"interfaceid,attr"`
}

type InterfaceSource struct {
	Bridge string `xml:"bridge,attr"`
}

type InterfaceTarget struct {
	Device string `xml:"dev,attr"`
}

type VirDomainMemoryStats struct {
	MajorFault    uint64
	MinorFault    uint64
	Unused        uint64
	Available     uint64
	ActualBalloon uint64
	Rss           uint64
	Usable        uint64
	DiskCaches    uint64
}
