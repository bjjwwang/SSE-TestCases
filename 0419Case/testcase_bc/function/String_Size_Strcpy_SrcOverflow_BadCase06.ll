; ModuleID = '/Users/jiaweiwang/CLionProjects/0419Case/testcase_bc/function/String_Size_Strcpy_SrcOverflow_BadCase06.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0419Case/function/String_Size_Strcpy_SrcOverflow_BadCase06.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i8* @GetInfoByAddr(i8* noundef %addr) #0 !dbg !9 {
entry:
  %addr.addr = alloca i8*, align 8
  store i8* %addr, i8** %addr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %addr.addr, metadata !16, metadata !DIExpression()), !dbg !17
  %0 = load i8*, i8** %addr.addr, align 8, !dbg !18
  ret i8* %0, !dbg !19
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @TestCaseBad06(i8* noundef %addr) #0 !dbg !20 {
entry:
  %addr.addr = alloca i8*, align 8
  %tempDst = alloca [10 x i8], align 1
  %src = alloca i8*, align 8
  store i8* %addr, i8** %addr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %addr.addr, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [10 x i8]* %tempDst, metadata !25, metadata !DIExpression()), !dbg !29
  %0 = bitcast [10 x i8]* %tempDst to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 10, i1 false), !dbg !29
  call void @llvm.dbg.declare(metadata i8** %src, metadata !30, metadata !DIExpression()), !dbg !31
  %1 = load i8*, i8** %addr.addr, align 8, !dbg !32
  %call = call i8* @GetInfoByAddr(i8* noundef %1), !dbg !33
  store i8* %call, i8** %src, align 8, !dbg !31
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %tempDst, i64 0, i64 0, !dbg !34
  %2 = load i8*, i8** %src, align 8, !dbg !34
  %call1 = call i8* @__strcpy_chk(i8* noundef %arraydecay, i8* noundef %2, i64 noundef 10) #4, !dbg !34
  ret void, !dbg !35
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strcpy_chk(i8* noundef, i8* noundef, i64 noundef) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0419Case/function/String_Size_Strcpy_SrcOverflow_BadCase06.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "GetInfoByAddr", scope: !10, file: !10, line: 9, type: !11, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!10 = !DIFile(filename: "function/String_Size_Strcpy_SrcOverflow_BadCase06.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !{}
!16 = !DILocalVariable(name: "addr", arg: 1, scope: !9, file: !10, line: 9, type: !13)
!17 = !DILocation(line: 9, column: 27, scope: !9)
!18 = !DILocation(line: 14, column: 9, scope: !9)
!19 = !DILocation(line: 14, column: 2, scope: !9)
!20 = distinct !DISubprogram(name: "TestCaseBad06", scope: !10, file: !10, line: 22, type: !21, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !13}
!23 = !DILocalVariable(name: "addr", arg: 1, scope: !20, file: !10, line: 22, type: !13)
!24 = !DILocation(line: 22, column: 26, scope: !20)
!25 = !DILocalVariable(name: "tempDst", scope: !20, file: !10, line: 24, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 80, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 10)
!29 = !DILocation(line: 24, column: 10, scope: !20)
!30 = !DILocalVariable(name: "src", scope: !20, file: !10, line: 25, type: !13)
!31 = !DILocation(line: 25, column: 8, scope: !20)
!32 = !DILocation(line: 25, column: 28, scope: !20)
!33 = !DILocation(line: 25, column: 14, scope: !20)
!34 = !DILocation(line: 28, column: 5, scope: !20)
!35 = !DILocation(line: 29, column: 1, scope: !20)
