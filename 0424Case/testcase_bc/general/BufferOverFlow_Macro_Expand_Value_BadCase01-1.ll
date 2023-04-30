; ModuleID = '/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/testcase_bc/general/BufferOverFlow_Macro_Expand_Value_BadCase01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/general/BufferOverFlow_Macro_Expand_Value_BadCase01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__FUNCTION__.main = private unnamed_addr constant [5 x i8] c"main\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i8* @MyGetFileName(i8* noundef %strDest) #0 !dbg !9 {
entry:
  %retval = alloca i8*, align 8
  %strDest.addr = alloca i8*, align 8
  %pcTemp = alloca i8*, align 8
  store i8* %strDest, i8** %strDest.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %strDest.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %pcTemp, metadata !20, metadata !DIExpression()), !dbg !22
  %0 = load i8*, i8** %strDest.addr, align 8, !dbg !23
  %call = call i8* @VosMemChr(i8* noundef %0, i8 noundef signext 0, i64 noundef 256), !dbg !24
  store i8* %call, i8** %pcTemp, align 8, !dbg !22
  %1 = load i8*, i8** %retval, align 8, !dbg !25
  ret i8* %1, !dbg !25
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i8* @VosMemChr(i8* noundef, i8 noundef signext, i64 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @MyLogTimeMonitor(i8* noundef %pucFileName) #0 !dbg !26 {
entry:
  %pucFileName.addr = alloca i8*, align 8
  store i8* %pucFileName, i8** %pucFileName.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %pucFileName.addr, metadata !32, metadata !DIExpression()), !dbg !33
  %0 = load i8*, i8** %pucFileName.addr, align 8, !dbg !34
  %call = call i8* @MyGetFileName(i8* noundef %0), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @MyStartTimeMonitor(i8* noundef %pucFileName) #0 !dbg !37 {
entry:
  %pucFileName.addr = alloca i8*, align 8
  store i8* %pucFileName, i8** %pucFileName.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %pucFileName.addr, metadata !38, metadata !DIExpression()), !dbg !39
  %0 = load i8*, i8** %pucFileName.addr, align 8, !dbg !40
  call void @MyLogTimeMonitor(i8* noundef %0), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  call void @MyStartTimeMonitor(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @__FUNCTION__.main, i64 0, i64 0)), !dbg !53
  ret i32 0, !dbg !54
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/general/BufferOverFlow_Macro_Expand_Value_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "MyGetFileName", scope: !10, file: !10, line: 27, type: !11, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!10 = !DIFile(filename: "general/BufferOverFlow_Macro_Expand_Value_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "VOS_CHAR", file: !10, line: 16, baseType: !16)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{}
!18 = !DILocalVariable(name: "strDest", arg: 1, scope: !9, file: !10, line: 27, type: !13)
!19 = !DILocation(line: 27, column: 49, scope: !9)
!20 = !DILocalVariable(name: "pcTemp", scope: !9, file: !10, line: 30, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!22 = !DILocation(line: 30, column: 15, scope: !9)
!23 = !DILocation(line: 30, column: 34, scope: !9)
!24 = !DILocation(line: 30, column: 24, scope: !9)
!25 = !DILocation(line: 31, column: 1, scope: !9)
!26 = distinct !DISubprogram(name: "MyLogTimeMonitor", scope: !10, file: !10, line: 34, type: !27, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!27 = !DISubroutineType(types: !28)
!28 = !{null, !29}
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !31)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR", file: !10, line: 17, baseType: !16)
!32 = !DILocalVariable(name: "pucFileName", arg: 1, scope: !26, file: !10, line: 34, type: !29)
!33 = !DILocation(line: 34, column: 35, scope: !26)
!34 = !DILocation(line: 36, column: 19, scope: !26)
!35 = !DILocation(line: 36, column: 5, scope: !26)
!36 = !DILocation(line: 37, column: 1, scope: !26)
!37 = distinct !DISubprogram(name: "MyStartTimeMonitor", scope: !10, file: !10, line: 40, type: !27, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!38 = !DILocalVariable(name: "pucFileName", arg: 1, scope: !37, file: !10, line: 40, type: !29)
!39 = !DILocation(line: 40, column: 37, scope: !37)
!40 = !DILocation(line: 42, column: 22, scope: !37)
!41 = !DILocation(line: 42, column: 5, scope: !37)
!42 = !DILocation(line: 43, column: 1, scope: !37)
!43 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 47, type: !44, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!44 = !DISubroutineType(types: !45)
!45 = !{!46, !46, !47}
!46 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !10, line: 47, type: !46)
!50 = !DILocation(line: 47, column: 14, scope: !43)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !10, line: 47, type: !47)
!52 = !DILocation(line: 47, column: 26, scope: !43)
!53 = !DILocation(line: 49, column: 5, scope: !43)
!54 = !DILocation(line: 50, column: 5, scope: !43)
