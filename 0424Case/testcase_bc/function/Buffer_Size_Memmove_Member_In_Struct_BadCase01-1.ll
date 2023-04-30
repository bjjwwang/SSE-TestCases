; ModuleID = '/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/testcase_bc/function/Buffer_Size_Memmove_Member_In_Struct_BadCase01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/function/Buffer_Size_Memmove_Member_In_Struct_BadCase01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.COMPAT_NCP_MOUNT_DATA = type { i32, [17 x i8] }
%struct.NCP_MOUNT_DATA = type { i32, [17 x i8] }

@__const.main.arr = private unnamed_addr constant [20 x i8] c"abcdefghijklmn\00\00\00\00\00\00", align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !13 {
entry:
  %arr = alloca [20 x i8], align 16
  call void @llvm.dbg.declare(metadata [20 x i8]* %arr, metadata !19, metadata !DIExpression()), !dbg !24
  %0 = bitcast [20 x i8]* %arr to i8*, !dbg !24
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 getelementptr inbounds ([20 x i8], [20 x i8]* @__const.main.arr, i32 0, i32 0), i64 20, i1 false), !dbg !24
  %arraydecay = getelementptr inbounds [20 x i8], [20 x i8]* %arr, i64 0, i64 0, !dbg !25
  %call = call i8* @TestCaseBad01(i8* noundef %arraydecay), !dbg !26
  ret i32 0, !dbg !27
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i8* @TestCaseBad01(i8* noundef %rawData) #0 !dbg !28 {
entry:
  %rawData.addr = alloca i8*, align 8
  %version = alloca i32, align 4
  %cn = alloca %struct.COMPAT_NCP_MOUNT_DATA*, align 8
  %n = alloca %struct.NCP_MOUNT_DATA*, align 8
  store i8* %rawData, i8** %rawData.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %rawData.addr, metadata !31, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i32* %version, metadata !33, metadata !DIExpression()), !dbg !34
  %0 = load i8*, i8** %rawData.addr, align 8, !dbg !35
  %1 = bitcast i8* %0 to i32*, !dbg !36
  %2 = load i32, i32* %1, align 4, !dbg !37
  store i32 %2, i32* %version, align 4, !dbg !34
  %3 = load i32, i32* %version, align 4, !dbg !38
  %cmp = icmp eq i32 %3, 3, !dbg !40
  br i1 %cmp, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct.COMPAT_NCP_MOUNT_DATA** %cn, metadata !42, metadata !DIExpression()), !dbg !52
  %4 = load i8*, i8** %rawData.addr, align 8, !dbg !53
  %5 = bitcast i8* %4 to %struct.COMPAT_NCP_MOUNT_DATA*, !dbg !53
  store %struct.COMPAT_NCP_MOUNT_DATA* %5, %struct.COMPAT_NCP_MOUNT_DATA** %cn, align 8, !dbg !52
  call void @llvm.dbg.declare(metadata %struct.NCP_MOUNT_DATA** %n, metadata !54, metadata !DIExpression()), !dbg !60
  %6 = load i8*, i8** %rawData.addr, align 8, !dbg !61
  %7 = bitcast i8* %6 to %struct.NCP_MOUNT_DATA*, !dbg !61
  store %struct.NCP_MOUNT_DATA* %7, %struct.NCP_MOUNT_DATA** %n, align 8, !dbg !60
  %8 = load %struct.NCP_MOUNT_DATA*, %struct.NCP_MOUNT_DATA** %n, align 8, !dbg !62
  %mountedVol = getelementptr inbounds %struct.NCP_MOUNT_DATA, %struct.NCP_MOUNT_DATA* %8, i32 0, i32 1, !dbg !62
  %arraydecay = getelementptr inbounds [17 x i8], [17 x i8]* %mountedVol, i64 0, i64 0, !dbg !62
  %9 = load %struct.COMPAT_NCP_MOUNT_DATA*, %struct.COMPAT_NCP_MOUNT_DATA** %cn, align 8, !dbg !62
  %mountedVol1 = getelementptr inbounds %struct.COMPAT_NCP_MOUNT_DATA, %struct.COMPAT_NCP_MOUNT_DATA* %9, i32 0, i32 1, !dbg !62
  %arraydecay2 = getelementptr inbounds [17 x i8], [17 x i8]* %mountedVol1, i64 0, i64 0, !dbg !62
  %10 = load %struct.NCP_MOUNT_DATA*, %struct.NCP_MOUNT_DATA** %n, align 8, !dbg !62
  %mountedVol3 = getelementptr inbounds %struct.NCP_MOUNT_DATA, %struct.NCP_MOUNT_DATA* %10, i32 0, i32 1, !dbg !62
  %arraydecay4 = getelementptr inbounds [17 x i8], [17 x i8]* %mountedVol3, i64 0, i64 0, !dbg !62
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %arraydecay4, i1 false, i1 true, i1 false), !dbg !62
  %call = call i8* @__memmove_chk(i8* noundef %arraydecay, i8* noundef %arraydecay2, i64 noundef 29, i64 noundef %11) #4, !dbg !62
  br label %if.end, !dbg !63

if.end:                                           ; preds = %if.then, %entry
  ret i8* null, !dbg !64
}

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/function/Buffer_Size_Memmove_Member_In_Struct_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 37, type: !15, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!14 = !DIFile(filename: "function/Buffer_Size_Memmove_Member_In_Struct_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!15 = !DISubroutineType(types: !16)
!16 = !{!17}
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !{}
!19 = !DILocalVariable(name: "arr", scope: !13, file: !14, line: 38, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 160, elements: !22)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !{!23}
!23 = !DISubrange(count: 20)
!24 = !DILocation(line: 38, column: 10, scope: !13)
!25 = !DILocation(line: 39, column: 19, scope: !13)
!26 = !DILocation(line: 39, column: 5, scope: !13)
!27 = !DILocation(line: 40, column: 1, scope: !13)
!28 = distinct !DISubprogram(name: "TestCaseBad01", scope: !14, file: !14, line: 23, type: !29, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!29 = !DISubroutineType(types: !30)
!30 = !{!5, !5}
!31 = !DILocalVariable(name: "rawData", arg: 1, scope: !28, file: !14, line: 23, type: !5)
!32 = !DILocation(line: 23, column: 34, scope: !28)
!33 = !DILocalVariable(name: "version", scope: !28, file: !14, line: 25, type: !17)
!34 = !DILocation(line: 25, column: 9, scope: !28)
!35 = !DILocation(line: 25, column: 36, scope: !28)
!36 = !DILocation(line: 25, column: 20, scope: !28)
!37 = !DILocation(line: 25, column: 19, scope: !28)
!38 = !DILocation(line: 27, column: 9, scope: !39)
!39 = distinct !DILexicalBlock(scope: !28, file: !14, line: 27, column: 9)
!40 = !DILocation(line: 27, column: 17, scope: !39)
!41 = !DILocation(line: 27, column: 9, scope: !28)
!42 = !DILocalVariable(name: "cn", scope: !43, file: !14, line: 28, type: !44)
!43 = distinct !DILexicalBlock(scope: !39, file: !14, line: 27, column: 23)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "COMPAT_NCP_MOUNT_DATA", file: !14, line: 15, size: 192, elements: !46)
!46 = !{!47, !48}
!47 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !45, file: !14, line: 16, baseType: !17, size: 32)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "mountedVol", scope: !45, file: !14, line: 17, baseType: !49, size: 136, offset: 32)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 136, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 17)
!52 = !DILocation(line: 28, column: 39, scope: !43)
!53 = !DILocation(line: 28, column: 44, scope: !43)
!54 = !DILocalVariable(name: "n", scope: !43, file: !14, line: 29, type: !55)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "NCP_MOUNT_DATA", file: !14, line: 10, size: 192, elements: !57)
!57 = !{!58, !59}
!58 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !56, file: !14, line: 11, baseType: !17, size: 32)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "mountedVol", scope: !56, file: !14, line: 12, baseType: !49, size: 136, offset: 32)
!60 = !DILocation(line: 29, column: 32, scope: !43)
!61 = !DILocation(line: 29, column: 36, scope: !43)
!62 = !DILocation(line: 32, column: 9, scope: !43)
!63 = !DILocation(line: 33, column: 5, scope: !43)
!64 = !DILocation(line: 34, column: 5, scope: !28)
