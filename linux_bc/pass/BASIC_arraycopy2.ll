; ModuleID = 'linux_bc/pass/BASIC_arraycopy2.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_arraycopy2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.source = private unnamed_addr constant [2 x i8] c"AB", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %source = alloca [2 x i8], align 1
  %x = alloca i8, align 1
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [2 x i8]* %source, metadata !14, metadata !DIExpression()), !dbg !19
  %0 = bitcast [2 x i8]* %source to i8*, !dbg !19
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([2 x i8], [2 x i8]* @__const.main.source, i32 0, i32 0), i64 2, i1 false), !dbg !19
  call void @llvm.dbg.declare(metadata i8* %x, metadata !20, metadata !DIExpression()), !dbg !21
  %arrayidx = getelementptr inbounds [2 x i8], [2 x i8]* %source, i64 0, i64 1, !dbg !22
  %1 = load i8, i8* %arrayidx, align 1, !dbg !22
  store i8 %1, i8* %x, align 1, !dbg !21
  %2 = load i8, i8* %x, align 1, !dbg !23
  %conv = sext i8 %2 to i32, !dbg !23
  %cmp = icmp eq i32 %conv, 66, !dbg !24
  %conv1 = zext i1 %cmp to i32, !dbg !24
  call void @svf_assert(i32 %conv1), !dbg !25
  ret i32 0, !dbg !26
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @svf_assert(i32) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_arraycopy2.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 2, type: !11, scopeLine: 2, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/BASIC_arraycopy2.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "source", scope: !9, file: !10, line: 3, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 16, elements: !17)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{!18}
!18 = !DISubrange(count: 2)
!19 = !DILocation(line: 3, column: 7, scope: !9)
!20 = !DILocalVariable(name: "x", scope: !9, file: !10, line: 4, type: !16)
!21 = !DILocation(line: 4, column: 7, scope: !9)
!22 = !DILocation(line: 4, column: 11, scope: !9)
!23 = !DILocation(line: 5, column: 13, scope: !9)
!24 = !DILocation(line: 5, column: 14, scope: !9)
!25 = !DILocation(line: 5, column: 2, scope: !9)
!26 = !DILocation(line: 6, column: 2, scope: !9)
