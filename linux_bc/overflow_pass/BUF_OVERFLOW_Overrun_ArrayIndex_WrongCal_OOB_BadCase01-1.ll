; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_WrongCal_OOB_BadCase01-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_WrongCal_OOB_BadCase01-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.tmp = private unnamed_addr constant [4 x i8] c"012\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !9 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !17, metadata !DIExpression()), !dbg !18
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %size, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32* %index, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [2 x i8]* %dest, metadata !25, metadata !DIExpression()), !dbg !29
  %0 = bitcast [2 x i8]* %dest to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 2, i1 false), !dbg !29
  call void @llvm.dbg.declare(metadata [4 x i8]* %tmp, metadata !30, metadata !DIExpression()), !dbg !34
  %1 = bitcast [4 x i8]* %tmp to i8*, !dbg !34
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([4 x i8], [4 x i8]* @__const.main.tmp, i32 0, i32 0), i64 4, i1 false), !dbg !34
  store i32 4, i32* %size, align 4, !dbg !35
  %2 = load i32, i32* %size, align 4, !dbg !36
  %sub = sub nsw i32 %2, 1, !dbg !37
  store i32 %sub, i32* %index, align 4, !dbg !38
  %3 = load i32, i32* %index, align 4, !dbg !39
  %idxprom = sext i32 %3 to i64, !dbg !40
  %arrayidx = getelementptr inbounds [4 x i8], [4 x i8]* %tmp, i64 0, i64 %idxprom, !dbg !40
  %4 = load i8, i8* %arrayidx, align 1, !dbg !40
  %5 = load i32, i32* %index, align 4, !dbg !41
  %idxprom1 = sext i32 %5 to i64, !dbg !42
  %arrayidx2 = getelementptr inbounds [2 x i8], [2 x i8]* %dest, i64 0, i64 %idxprom1, !dbg !42
  store i8 %4, i8* %arrayidx2, align 1, !dbg !43
  ret i32 0, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_WrongCal_OOB_BadCase01-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 30, type: !11, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_WrongCal_OOB_BadCase01-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13, !14}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !DILocalVariable(name: "argc", arg: 1, scope: !9, file: !10, line: 30, type: !13)
!18 = !DILocation(line: 30, column: 14, scope: !9)
!19 = !DILocalVariable(name: "argv", arg: 2, scope: !9, file: !10, line: 30, type: !14)
!20 = !DILocation(line: 30, column: 27, scope: !9)
!21 = !DILocalVariable(name: "size", scope: !9, file: !10, line: 32, type: !13)
!22 = !DILocation(line: 32, column: 9, scope: !9)
!23 = !DILocalVariable(name: "index", scope: !9, file: !10, line: 33, type: !13)
!24 = !DILocation(line: 33, column: 9, scope: !9)
!25 = !DILocalVariable(name: "dest", scope: !9, file: !10, line: 34, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 16, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 2)
!29 = !DILocation(line: 34, column: 10, scope: !9)
!30 = !DILocalVariable(name: "tmp", scope: !9, file: !10, line: 35, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 32, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 4)
!34 = !DILocation(line: 35, column: 10, scope: !9)
!35 = !DILocation(line: 37, column: 10, scope: !9)
!36 = !DILocation(line: 38, column: 13, scope: !9)
!37 = !DILocation(line: 38, column: 18, scope: !9)
!38 = !DILocation(line: 38, column: 11, scope: !9)
!39 = !DILocation(line: 41, column: 23, scope: !9)
!40 = !DILocation(line: 41, column: 19, scope: !9)
!41 = !DILocation(line: 41, column: 10, scope: !9)
!42 = !DILocation(line: 41, column: 5, scope: !9)
!43 = !DILocation(line: 41, column: 17, scope: !9)
!44 = !DILocation(line: 43, column: 5, scope: !9)
