; ModuleID = '/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/testcase_bc/function/Buffer_Size_Strncpy_Src_Array_Point_BadCase03-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/function/Buffer_Size_Strncpy_Src_Array_Point_BadCase03-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.TestCaseBad03.deviceBlockPath = private unnamed_addr constant [12 x i8] c"/dev/block/\00", align 1
@__const.TestCaseBad03.devicePathEmmc = private unnamed_addr constant [11 x i8] c"mmcblk0p28\00", align 1
@__const.TestCaseBad03.devicePathUfs = private unnamed_addr constant [6 x i8] c"sdd24\00", align 1
@__const.main.str = private unnamed_addr constant [8 x i8] c"abcdefg\00", align 1
@__const.main.pblkname = private unnamed_addr constant [8 x i8] c"abcdefg\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @GetBootdeviceType() #0 !dbg !15 {
entry:
  ret i32 0, !dbg !18
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @TestCaseBad03(i8* noundef %str, i8* noundef %pblkname) #0 !dbg !19 {
entry:
  %str.addr = alloca i8*, align 8
  %pblkname.addr = alloca i8*, align 8
  %deviceBlockPath = alloca [12 x i8], align 1
  %devicePathEmmc = alloca [11 x i8], align 1
  %devicePathUfs = alloca [6 x i8], align 1
  %bootDeviceType = alloca i32, align 4
  store i8* %str, i8** %str.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %str.addr, metadata !26, metadata !DIExpression()), !dbg !27
  store i8* %pblkname, i8** %pblkname.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %pblkname.addr, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [12 x i8]* %deviceBlockPath, metadata !30, metadata !DIExpression()), !dbg !34
  %0 = bitcast [12 x i8]* %deviceBlockPath to i8*, !dbg !34
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([12 x i8], [12 x i8]* @__const.TestCaseBad03.deviceBlockPath, i32 0, i32 0), i64 12, i1 false), !dbg !34
  call void @llvm.dbg.declare(metadata [11 x i8]* %devicePathEmmc, metadata !35, metadata !DIExpression()), !dbg !39
  %1 = bitcast [11 x i8]* %devicePathEmmc to i8*, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.TestCaseBad03.devicePathEmmc, i32 0, i32 0), i64 11, i1 false), !dbg !39
  call void @llvm.dbg.declare(metadata [6 x i8]* %devicePathUfs, metadata !40, metadata !DIExpression()), !dbg !44
  %2 = bitcast [6 x i8]* %devicePathUfs to i8*, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([6 x i8], [6 x i8]* @__const.TestCaseBad03.devicePathUfs, i32 0, i32 0), i64 6, i1 false), !dbg !44
  call void @llvm.dbg.declare(metadata i32* %bootDeviceType, metadata !45, metadata !DIExpression()), !dbg !46
  %3 = load i8*, i8** %pblkname.addr, align 8, !dbg !47
  %tobool = icmp ne i8* %3, null, !dbg !47
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !49

lor.lhs.false:                                    ; preds = %entry
  %4 = load i8*, i8** %str.addr, align 8, !dbg !50
  %tobool1 = icmp ne i8* %4, null, !dbg !50
  br i1 %tobool1, label %if.end, label %if.then, !dbg !51

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %if.end24, !dbg !52

if.end:                                           ; preds = %lor.lhs.false
  %call = call i32 @GetBootdeviceType(), !dbg !54
  store i32 %call, i32* %bootDeviceType, align 4, !dbg !55
  %5 = load i32, i32* %bootDeviceType, align 4, !dbg !56
  %cmp = icmp eq i32 %5, 0, !dbg !58
  br i1 %cmp, label %if.then2, label %if.else, !dbg !59

if.then2:                                         ; preds = %if.end
  %6 = load i8*, i8** %pblkname.addr, align 8, !dbg !60
  %arraydecay = getelementptr inbounds [12 x i8], [12 x i8]* %deviceBlockPath, i64 0, i64 0, !dbg !60
  %arraydecay3 = getelementptr inbounds [12 x i8], [12 x i8]* %deviceBlockPath, i64 0, i64 0, !dbg !60
  %call4 = call i64 @strlen(i8* noundef %arraydecay3), !dbg !60
  %7 = load i8*, i8** %pblkname.addr, align 8, !dbg !60
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !60
  %call5 = call i8* @__strncpy_chk(i8* noundef %6, i8* noundef %arraydecay, i64 noundef %call4, i64 noundef %8) #5, !dbg !60
  %9 = load i8*, i8** %pblkname.addr, align 8, !dbg !62
  %arraydecay6 = getelementptr inbounds [12 x i8], [12 x i8]* %deviceBlockPath, i64 0, i64 0, !dbg !62
  %call7 = call i64 @strlen(i8* noundef %arraydecay6), !dbg !62
  %add.ptr = getelementptr inbounds i8, i8* %9, i64 %call7, !dbg !62
  %arraydecay8 = getelementptr inbounds [11 x i8], [11 x i8]* %devicePathEmmc, i64 0, i64 0, !dbg !62
  %arraydecay9 = getelementptr inbounds [11 x i8], [11 x i8]* %devicePathEmmc, i64 0, i64 0, !dbg !62
  %call10 = call i64 @strlen(i8* noundef %arraydecay9), !dbg !62
  %add = add i64 %call10, 1, !dbg !62
  %call11 = call i8* @__strncpy_chk(i8* noundef %add.ptr, i8* noundef %arraydecay8, i64 noundef %add, i64 noundef -1) #5, !dbg !62
  br label %if.end24, !dbg !63

if.else:                                          ; preds = %if.end
  %10 = load i8*, i8** %pblkname.addr, align 8, !dbg !64
  %arraydecay12 = getelementptr inbounds [12 x i8], [12 x i8]* %deviceBlockPath, i64 0, i64 0, !dbg !64
  %arraydecay13 = getelementptr inbounds [12 x i8], [12 x i8]* %deviceBlockPath, i64 0, i64 0, !dbg !64
  %call14 = call i64 @strlen(i8* noundef %arraydecay13), !dbg !64
  %11 = load i8*, i8** %pblkname.addr, align 8, !dbg !64
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !64
  %call15 = call i8* @__strncpy_chk(i8* noundef %10, i8* noundef %arraydecay12, i64 noundef %call14, i64 noundef %12) #5, !dbg !64
  %13 = load i8*, i8** %pblkname.addr, align 8, !dbg !66
  %arraydecay16 = getelementptr inbounds [12 x i8], [12 x i8]* %deviceBlockPath, i64 0, i64 0, !dbg !66
  %call17 = call i64 @strlen(i8* noundef %arraydecay16), !dbg !66
  %add.ptr18 = getelementptr inbounds i8, i8* %13, i64 %call17, !dbg !66
  %arraydecay19 = getelementptr inbounds [6 x i8], [6 x i8]* %devicePathUfs, i64 0, i64 0, !dbg !66
  %arraydecay20 = getelementptr inbounds [6 x i8], [6 x i8]* %devicePathUfs, i64 0, i64 0, !dbg !66
  %call21 = call i64 @strlen(i8* noundef %arraydecay20), !dbg !66
  %add22 = add i64 %call21, 1, !dbg !66
  %call23 = call i8* @__strncpy_chk(i8* noundef %add.ptr18, i8* noundef %arraydecay19, i64 noundef %add22, i64 noundef -1) #5, !dbg !66
  br label %if.end24

if.end24:                                         ; preds = %if.else, %if.then2, %if.then
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strncpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @strlen(i8* noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %str = alloca [8 x i8], align 1
  %pblkname = alloca [8 x i8], align 1
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [8 x i8]* %str, metadata !72, metadata !DIExpression()), !dbg !76
  %0 = bitcast [8 x i8]* %str to i8*, !dbg !76
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([8 x i8], [8 x i8]* @__const.main.str, i32 0, i32 0), i64 8, i1 false), !dbg !76
  call void @llvm.dbg.declare(metadata [8 x i8]* %pblkname, metadata !77, metadata !DIExpression()), !dbg !78
  %1 = bitcast [8 x i8]* %pblkname to i8*, !dbg !78
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([8 x i8], [8 x i8]* @__const.main.pblkname, i32 0, i32 0), i64 8, i1 false), !dbg !78
  %arraydecay = getelementptr inbounds [8 x i8], [8 x i8]* %str, i64 0, i64 0, !dbg !79
  %arraydecay1 = getelementptr inbounds [8 x i8], [8 x i8]* %pblkname, i64 0, i64 0, !dbg !80
  call void @TestCaseBad03(i8* noundef %arraydecay, i8* noundef %arraydecay1), !dbg !81
  ret i32 0, !dbg !82
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/function/Buffer_Size_Strncpy_Src_Array_Point_BadCase03-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!2 = !{!3}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "BOOTDEVICE_TYPE", file: !4, line: 10, baseType: !5, size: 32, elements: !6)
!4 = !DIFile(filename: "function/Buffer_Size_Strncpy_Src_Array_Point_BadCase03-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!7}
!7 = !DIEnumerator(name: "BOOT_DEVICE_EMMC", value: 0)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"Homebrew clang version 14.0.6"}
!15 = distinct !DISubprogram(name: "GetBootdeviceType", scope: !4, file: !4, line: 14, type: !16, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!16 = !DISubroutineType(types: !2)
!17 = !{}
!18 = !DILocation(line: 16, column: 5, scope: !15)
!19 = distinct !DISubprogram(name: "TestCaseBad03", scope: !4, file: !4, line: 22, type: !20, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!20 = !DISubroutineType(types: !21)
!21 = !{null, !22, !25}
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !24)
!24 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!26 = !DILocalVariable(name: "str", arg: 1, scope: !19, file: !4, line: 22, type: !22)
!27 = !DILocation(line: 22, column: 32, scope: !19)
!28 = !DILocalVariable(name: "pblkname", arg: 2, scope: !19, file: !4, line: 22, type: !25)
!29 = !DILocation(line: 22, column: 43, scope: !19)
!30 = !DILocalVariable(name: "deviceBlockPath", scope: !19, file: !4, line: 24, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 96, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 12)
!34 = !DILocation(line: 24, column: 10, scope: !19)
!35 = !DILocalVariable(name: "devicePathEmmc", scope: !19, file: !4, line: 25, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 88, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 11)
!39 = !DILocation(line: 25, column: 10, scope: !19)
!40 = !DILocalVariable(name: "devicePathUfs", scope: !19, file: !4, line: 26, type: !41)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 48, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 6)
!44 = !DILocation(line: 26, column: 10, scope: !19)
!45 = !DILocalVariable(name: "bootDeviceType", scope: !19, file: !4, line: 27, type: !3)
!46 = !DILocation(line: 27, column: 26, scope: !19)
!47 = !DILocation(line: 29, column: 11, scope: !48)
!48 = distinct !DILexicalBlock(scope: !19, file: !4, line: 29, column: 9)
!49 = !DILocation(line: 29, column: 21, scope: !48)
!50 = !DILocation(line: 29, column: 26, scope: !48)
!51 = !DILocation(line: 29, column: 9, scope: !19)
!52 = !DILocation(line: 30, column: 9, scope: !53)
!53 = distinct !DILexicalBlock(scope: !48, file: !4, line: 29, column: 32)
!54 = !DILocation(line: 33, column: 22, scope: !19)
!55 = !DILocation(line: 33, column: 20, scope: !19)
!56 = !DILocation(line: 34, column: 9, scope: !57)
!57 = distinct !DILexicalBlock(scope: !19, file: !4, line: 34, column: 9)
!58 = !DILocation(line: 34, column: 24, scope: !57)
!59 = !DILocation(line: 34, column: 9, scope: !19)
!60 = !DILocation(line: 37, column: 9, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !4, line: 34, column: 45)
!62 = !DILocation(line: 38, column: 9, scope: !61)
!63 = !DILocation(line: 39, column: 5, scope: !61)
!64 = !DILocation(line: 40, column: 9, scope: !65)
!65 = distinct !DILexicalBlock(scope: !57, file: !4, line: 39, column: 12)
!66 = !DILocation(line: 41, column: 9, scope: !65)
!67 = !DILocation(line: 43, column: 1, scope: !19)
!68 = distinct !DISubprogram(name: "main", scope: !4, file: !4, line: 45, type: !69, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!69 = !DISubroutineType(types: !70)
!70 = !{!71}
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocalVariable(name: "str", scope: !68, file: !4, line: 46, type: !73)
!73 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 64, elements: !74)
!74 = !{!75}
!75 = !DISubrange(count: 8)
!76 = !DILocation(line: 46, column: 10, scope: !68)
!77 = !DILocalVariable(name: "pblkname", scope: !68, file: !4, line: 47, type: !73)
!78 = !DILocation(line: 47, column: 10, scope: !68)
!79 = !DILocation(line: 48, column: 19, scope: !68)
!80 = !DILocation(line: 48, column: 24, scope: !68)
!81 = !DILocation(line: 48, column: 5, scope: !68)
!82 = !DILocation(line: 49, column: 5, scope: !68)
