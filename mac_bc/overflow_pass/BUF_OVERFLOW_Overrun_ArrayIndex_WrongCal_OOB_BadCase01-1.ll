; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_WrongCal_OOB_BadCase01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_WrongCal_OOB_BadCase01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.main.tmp = private unnamed_addr constant [4 x i8] c"012\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %size = alloca i32, align 4
  %index = alloca i32, align 4
  %dest = alloca [2 x i8], align 1
  %tmp = alloca [4 x i8], align 1
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !18, metadata !DIExpression()), !dbg !19
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %size, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %index, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [2 x i8]* %dest, metadata !26, metadata !DIExpression()), !dbg !30
  %0 = bitcast [2 x i8]* %dest to i8*, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 2, i1 false), !dbg !30
  call void @llvm.dbg.declare(metadata [4 x i8]* %tmp, metadata !31, metadata !DIExpression()), !dbg !35
  %1 = bitcast [4 x i8]* %tmp to i8*, !dbg !35
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([4 x i8], [4 x i8]* @__const.main.tmp, i32 0, i32 0), i64 4, i1 false), !dbg !35
  store i32 4, i32* %size, align 4, !dbg !36
  %2 = load i32, i32* %size, align 4, !dbg !37
  %sub = sub nsw i32 %2, 1, !dbg !38
  store i32 %sub, i32* %index, align 4, !dbg !39
  %3 = load i32, i32* %index, align 4, !dbg !40
  %idxprom = sext i32 %3 to i64, !dbg !41
  %arrayidx = getelementptr inbounds [4 x i8], [4 x i8]* %tmp, i64 0, i64 %idxprom, !dbg !41
  %4 = load i8, i8* %arrayidx, align 1, !dbg !41
  %5 = load i32, i32* %index, align 4, !dbg !42
  %idxprom1 = sext i32 %5 to i64, !dbg !43
  %arrayidx2 = getelementptr inbounds [2 x i8], [2 x i8]* %dest, i64 0, i64 %idxprom1, !dbg !43
  store i8 %4, i8* %arrayidx2, align 1, !dbg !44
  ret i32 0, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_WrongCal_OOB_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 30, type: !11, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_WrongCal_OOB_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13, !14}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{}
!18 = !DILocalVariable(name: "argc", arg: 1, scope: !9, file: !10, line: 30, type: !13)
!19 = !DILocation(line: 30, column: 14, scope: !9)
!20 = !DILocalVariable(name: "argv", arg: 2, scope: !9, file: !10, line: 30, type: !14)
!21 = !DILocation(line: 30, column: 27, scope: !9)
!22 = !DILocalVariable(name: "size", scope: !9, file: !10, line: 32, type: !13)
!23 = !DILocation(line: 32, column: 9, scope: !9)
!24 = !DILocalVariable(name: "index", scope: !9, file: !10, line: 33, type: !13)
!25 = !DILocation(line: 33, column: 9, scope: !9)
!26 = !DILocalVariable(name: "dest", scope: !9, file: !10, line: 34, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 16, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 2)
!30 = !DILocation(line: 34, column: 10, scope: !9)
!31 = !DILocalVariable(name: "tmp", scope: !9, file: !10, line: 35, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 32, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 4)
!35 = !DILocation(line: 35, column: 10, scope: !9)
!36 = !DILocation(line: 37, column: 10, scope: !9)
!37 = !DILocation(line: 38, column: 13, scope: !9)
!38 = !DILocation(line: 38, column: 18, scope: !9)
!39 = !DILocation(line: 38, column: 11, scope: !9)
!40 = !DILocation(line: 41, column: 23, scope: !9)
!41 = !DILocation(line: 41, column: 19, scope: !9)
!42 = !DILocation(line: 41, column: 10, scope: !9)
!43 = !DILocation(line: 41, column: 5, scope: !9)
!44 = !DILocation(line: 41, column: 17, scope: !9)
!45 = !DILocation(line: 43, column: 5, scope: !9)
